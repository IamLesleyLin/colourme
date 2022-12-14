import base64
from flask import Flask, jsonify, render_template #模板套件,
from flask import request #解析套件
from flask_cors import CORS
import pymysql
import cv2
import numpy as np
import re
import pandas as pd
import urllib

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
slick_sql = """SELECT `parser_hot_list`.`numbers`, `parser_hot_list`.`id`, `parser_text`.`name`, 
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
        names = " ".join(re.findall("\w+\s+", i[2]))
        hot = i[3]
        url = i[4]
        slick_list.append({"numbers": numbers, "id": ids, "name": names, "hot": hot, "url": url})

cursor.close()

################
cursor = db.cursor()
product_sql = """SELECT `category`.`id`, `category`.`name`, `productid_imgurl`.`imgURL` 
            FROM `category` 
            INNER JOIN `productid_imgurl` ON `category`.`id` = `productid_imgurl`.`id`"""
cursor.execute(product_sql)

if cursor.rowcount > 0:
    results = cursor.fetchall()

    product_list = []
    for i in results:
        ids = i[0]
        # names = " ".join(re.findall("\w+\s+", i[2]))
        names = i[1]
        url = i[2]
        product_list.append({"id": ids, "name": names, "url": url})

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
        # print(img_decoded)
        img_gray = cv2.cvtColor(img_decoded, cv2.COLOR_BGR2GRAY)
        imagg = cv2.resize(img_gray, (100 , 100) , interpolation=cv2.INTER_AREA)
        imgggg = imagg.flatten()
        df=imgggg
        # df = pd.DataFrame(imgggg)
        # print (df)
        df[ df == np.argmax(np.bincount(df))]= 255 #找出背景最多的數字，再指定成255
        # print(df)
        df = df.reshape(100, 100)
        print(df)
        img_encoded2 = cv2.imencode('.jpg', df)

        cv2.imwrite = ("123455.jpg",img_encoded2 )
        
        # imgGraySmall = []
        # imgGraySmall.insert(0, img_01)
        # result = img_gray.shape
        # print(img_gray.shape)
        return render_template('result_page.html', slick_list=slick_list, img_encoded=img_encoded)

@app.route('/product_page',methods=['GET', "POST"])
def product_page():
    if request.method == 'GET':
        return render_template('product_page.html', product_list=product_list)

    if request.method == 'POST':


        cursor = db.cursor()

        cllection_insert = """INSERT INTO `collection` VALUES (%s);"""
        # p_id = request.values.get('p_id') # 用 form 的方法
        # cursor.execute(cllection_insert, (p_id))
        cursor.execute(cllection_insert, (request.json["id"])) # 用 js 的方法

        db.commit()
        cursor.close()

        return render_template('product_page.html', product_list=product_list)

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

        return render_template('collection_page.html', collection_list=collection_list)

if __name__ == '__main__':
   app.run()
   db.close()




#http://127.0.0.1:5000 = http://localhost:5000

