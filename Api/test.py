import base64
from flask import Flask, jsonify, render_template #模板套件,
from flask import request #解析套件
from flask_cors import CORS
import pymysql
import cv2
import numpy as np
import re

from flask import url_for, redirect, flash

app = Flask(__name__)


@app.route('/',methods=['GET'])
def product_page():
    return render_template('home_page copy.html')

if __name__ == '__main__':
   app.run()


#http://127.0.0.1:5000 = http://localhost:5000

