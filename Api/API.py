from flask import Flask
from flask import Flask, jsonify, render_template #模板套件,
from flask import request #解析套件

from flask import url_for, redirect, flash

app = Flask(__name__)

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
            return redirect(url_for('main_page')) # return render_template('main_page.html')
    return render_template('log_in.html', error=error)

@app.route('/main_page',methods=['GET', 'POST'])
def main_page():
    if request.method == 'GET':
        return render_template('main_page.html')

if __name__ == '__main__':
   app.run()


#http://127.0.0.1:5000 = http://localhost:5000

