import base64
from flask import Flask, jsonify, render_template #模板套件,
from flask import request #解析套件
from flask_cors import CORS
import pymysql
import cv2
import numpy as np
from keras.models import load_model

model_12 = load_model('./static/model_forweb.h5')
model_50 = load_model('./LINEBOT/static/model_forLINE.h5')

from flask import url_for, redirect, flash

app = Flask(__name__)

CORS(app, resources={r"./*":{"origins":["*"]}})

db = pymysql.connect(
            host='localhost',
            port=3306,
            user='root',
            passwd='',
            database='colourme',
            charset='utf8mb4',
        )

################
cursor = db.cursor()
slick_sql = """SELECT DISTINCT(`parser_hot_list`.`numbers`), `parser_hot_list`.`id`, `parser_text`.`name`,
        `parser_hot_list`.`Hot`, `productid_imgurl`.`imgURL` FROM `parser_hot_list`
        INNER JOIN `productid_imgurl` ON `parser_hot_list`.`id` = `productid_imgurl`.`id`
        INNER JOIN `parser_text` ON `parser_hot_list`.`id` = `parser_text`.`id`
        WHERE Hot > 0
        ORDER BY Hot DESC"""
cursor.execute(slick_sql)

if cursor.rowcount > 0:
    results = cursor.fetchall()

    slick_list = []
    for i in results:
        numbers = i[0]
        ids = i[1]
        names = i[2]
        # names = " ".join(re.findall("\w+\s+", i[2]))
        hot = i[3]
        url = i[4]
        slick_list.append({"numbers": numbers, "id": ids, "name": names, "hot": hot, "url": url})

cursor.close()

################
cursor = db.cursor()
product_sql = """SELECT `category`.`id`, `category`.`name`, `category`.`text`, `productid_imgurl`.`imgURL` 
            FROM `category` 
            INNER JOIN `productid_imgurl` ON `category`.`id` = `productid_imgurl`.`id`"""
cursor.execute(product_sql)

if cursor.rowcount > 0:
    results = cursor.fetchall()

    product_list = []
    for i in results:
        ids = i[0]
        names = i[1]
        text = i[2].replace("'", "").split(sep=",")
        text_list = []
        for index, u in enumerate(text):
            text_list.append({f"text{index}":u})
        url = i[3]
        product_list.append({"id": ids, "name": names, "text": text_list, "url": url})
cursor.close()

################
cursor = db.cursor()
DROP_table = "DROP TABLE IF EXISTS collection"
cursor.execute(DROP_table)
CREATE_table = "CREATE TABLE IF NOT EXISTS collection(id CHAR(20) NOT NULL)"
cursor.execute(CREATE_table)
cursor.close()

################
@app.route('/',methods=['GET'])
def home_page():
    return render_template('/home_page.html')

@app.route('/log_in', methods=['GET', 'POST'])
def log_in():
    error = None
    if request.method == 'POST':
        if request.form['username'] != 'itri' or request.form['password'] != 'itri':
            error = 'Invalid username or password. Please try again!'
        else:
            return redirect(url_for('main_page')) #return render_template('main_page.html')
    return render_template('log_in.html', error=error)

@app.route('/main_page',methods=['GET', 'POST'])
def main_page():
    if request.method == 'GET':
        return render_template('main_page.html', slick_list=slick_list)

    if request.method == 'POST':
        img = request.files['photo']
        img_read = img.read() #img_read = img.stream.read()
        # present preview img on the website
        img_encoded = base64.b64encode(img_read).decode('ascii')

        # execute back-end operations
        img_decoded = cv2.imdecode(np.frombuffer(img_read, np.uint8), 1)
        img_gray = cv2.cvtColor(img_decoded, cv2.COLOR_BGR2GRAY)
        img_resized = cv2.resize(img_gray, (100 , 100) , interpolation=cv2.INTER_AREA)
        img_flat = img_resized.flatten()
        img_flat[img_flat == np.argmax(np.bincount(img_flat))]= 255 #找出背景最多的數字，再指定成255
        img_reshaped = img_flat.reshape(-1,100,100,1)

        # model_12
        img_pre12 = model_12.predict(img_reshaped)
        no_12 = np.argmax(img_pre12[0]) #得到最相近的照片組別index

        cursor = db.cursor()
        select_sql_12 = f"""SELECT `category` FROM `category_label_12` WHERE `category_num`= {no_12}"""
        cursor.execute(select_sql_12)

        if cursor.rowcount > 0:
            results_12 = cursor.fetchall()

            result_list_12 = []
            for i in results_12:
                label = i[0]
                result_list_12.append({"label":label})
        cursor.close()

        # model_50
        img_pre50 = model_50.predict(img_reshaped)
        no_50 = np.argmax(img_pre50[0])  # 得到最相近的照片index

        cursor = db.cursor()
        select_sql_50 = f"""SELECT `category`.`numbers`,`category`.`id`,`category`.`name`,`category`.`text`,`category`.`price`,`productid_imgurl`.`imgURL`
                        FROM ((`productid_imgurl`
                        LEFT JOIN `category`
                        ON `category`.`numbers`= `productid_imgurl`.`numbers`)
                        RIGHT JOIN `model_label_50` ON `model_label_50`.`numbers`= `productid_imgurl`.`numbers`)
                        WHERE `model_label_50`.`label`= {no_50}"""
        cursor.execute(select_sql_50)

        if cursor.rowcount > 0:
            results_50 = cursor.fetchall()

            result_list_50 = []
            for i in results_50:
                numbers = i[0]
                ids = i[1]
                names = i[2]
                text = i[3].replace("'", "").split(sep=",")
                text_list = []
                for index, u in enumerate(text):
                    text_list.append({f"text{index}": u})
                price = i[4]
                url = i[5]
                result_list_50.append({"numbers": numbers,"ids": ids, "names": names,"text":text_list, "price":price, "url": url})
        cursor.close()

        return render_template('result_page.html', slick_list=slick_list, img_encoded=img_encoded,result_list_12 = result_list_12, result_list_50 = result_list_50)

@app.route('/product_page',methods=['GET', "POST"])
def product_page():
    if request.method == 'GET':
        return render_template('product_page.html', product_list=product_list)

    if request.method == 'POST':
        cat_list = ['', 'Retropy', 'Superstar', 'Others', 'Campus', 'Ozweego', 'Sneaker', 'Gazelle', 'NMD', 'Abaca',
                    'Centennial', 'Puffylette', 'Adiease']

        cursor = db.cursor()
        cllection_insert = """INSERT INTO `collection` VALUES (%s);"""
        # p_id = request.values.get('p_id') # 用 form 的方法
        # cursor.execute(cllection_insert, (p_id))
        try:
            cursor.execute(cllection_insert, (request.json["id"])) # 用 js 的方法
            db.commit()
        except:
            print('selection process')

        selection_sql = f"""SELECT `category`.`id`, `category`.`name`, `category`.`text`, `productid_imgurl`.`imgURL` FROM `category` 
                            INNER JOIN `productid_imgurl` ON `category`.`id` = `productid_imgurl`.`id`
                            WHERE `category`.`category` = '{request.values.get('c_id')}'"""
        if request.values.get('c_id') != "":
            cursor.execute(selection_sql)
        else:
            cursor.execute("""SELECT `category`.`id`, `category`.`name`, `category`.`text`, `productid_imgurl`.`imgURL` FROM `category` 
                            INNER JOIN `productid_imgurl` ON `category`.`id` = `productid_imgurl`.`id`""")

        product_list1 = []
        if cursor.rowcount > 0:
            results = cursor.fetchall()

            product_list1 = []
            for i in results:
                ids = i[0]
                names = i[1]
                text = i[2].replace("'", "").split(sep=",")
                text_list = []
                for index, u in enumerate(text):
                    text_list.append({f"text{index}": u})
                url = i[3]
                product_list1.append({"id": ids, "name": names, "text": text_list, "url": url})

        cursor.close()
        return render_template('product_page.html', product_list=product_list1)

@app.route('/collection_page',methods=['GET', 'POST'])
def collection_page():
    if request.method == 'GET':
        collection_list = []

        cursor = db.cursor()
        collection_sql = """SELECT DISTINCT(`collection`.`id`), `category`.`name`, `productid_imgurl`.`imgURL` 
                            FROM `collection` 
                            INNER JOIN `category` ON `collection`.`id` = `category`.`id`
                            INNER JOIN `productid_imgurl` ON `collection`.`id` = `productid_imgurl`.`id`"""
        cursor.execute(collection_sql)

        if cursor.rowcount > 0:
            results = cursor.fetchall()

            for i in results:
                ids = i[0]
                # names = " ".join(re.findall("\w+\s+", i[2]))
                names = i[1]
                url = i[2]
                collection_list.append({"id": ids, "name": names, "url": url})

        cursor.close()
        return render_template('collection_page.html', collection_list = collection_list)

    if request.method == 'POST':
        collection_list = []

        cursor = db.cursor()

        p_id = request.values.get('p_id')
        deletion_sql = f"""DELETE FROM `collection` WHERE `id` = '{p_id}'"""
        cursor.execute(deletion_sql)

        collection_sql = """SELECT DISTINCT(`collection`.`id`), `category`.`name`, `productid_imgurl`.`imgURL`
                            FROM `collection`
                            INNER JOIN `category` ON `collection`.`id` = `category`.`id`
                            INNER JOIN `productid_imgurl` ON `collection`.`id` = `productid_imgurl`.`id`"""
        cursor.execute(collection_sql)

        if cursor.rowcount > 0:
            results = cursor.fetchall()

            for i in results:
                ids = i[0]
                # names = " ".join(re.findall("\w+\s+", i[2]))
                names = i[1]
                url = i[2]
                collection_list.append({"id": ids, "name": names, "url": url})

        db.commit()
        cursor.close()
        return render_template('collection_page.html', collection_list=collection_list)

# @app.route('/result_page',methods=['GET', 'POST'])
# def result_page():
#     if request.method == 'GET':
#         return render_template('result_page.html', slick_list=slick_list , result_list = result_list)

if __name__ == '__main__':
   app.run()
   db.close()


# 

#http://127.0.0.1:5000 = http://localhost:5000

