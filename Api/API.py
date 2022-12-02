from flask import Flask
from flask import Flask, jsonify, render_template #模板套件,
from flask import request #解析套件

from flask import url_for, redirect, flash

app = Flask(__name__)

@app.route('/',methods=['GET'])
def home():
    return render_template('/main_page.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None

    if request.method == 'POST':
        if request.form['username'] != 'ITRI' or \
           request.form['password'] != 'ITRI':
                error = 'Invalid username or password. Please try again!'
        else:
            flash('You were successfully logged in')
            return redirect(url_for('index'))
            # return render_template("index.html")
    return render_template('login.html', error=error)



if __name__ == '__main__':
   app.run()

#http://127.0.0.1:5000 = http://localhost:5000

