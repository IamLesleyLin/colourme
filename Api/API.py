import base64

from flask import Flask
from flask import Flask, jsonify, render_template #模板套件,
from flask import request #解析套件
from flask_cors import CORS
import pymysql
import os
import pathlib
import cv2
import numpy as np
import re

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

cursor = db.cursor()
sql = """SELECT `parser_hot_list`.`numbers`, `parser_hot_list`.`id`, `parser_text`.`name`, 
        `parser_hot_list`.`Hot`, `productid_imgurl`.`imgURL` FROM `parser_hot_list` 
        INNER JOIN `productid_imgurl` ON `parser_hot_list`.`id` = `productid_imgurl`.`id` 
        INNER JOIN `parser_text` ON `parser_hot_list`.`id` = `parser_text`.`id` 
        WHERE Hot > 0 
        ORDER BY Hot DESC"""
cursor.execute(sql)

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
    db.close()

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
        print(img_decoded)
        # img_gray = cv2.cvtColor(img_decoded, cv2.COLOR_BGR2GRAY)
        # result = img_gray.shape
        # print(img_gray.shape)
        return render_template('main_page.html', slick_list=slick_list, img_encoded=img_encoded)

if __name__ == '__main__':
   app.run()


#http://127.0.0.1:5000 = http://localhost:5000

