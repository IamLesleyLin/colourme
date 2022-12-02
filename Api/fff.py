from flask import Flask
from flask import Flask, jsonify, render_template #模板套件,
from flask import request #解析套件


app = Flask(__name__)

@app.route('/',methods=['GET'])
def home():
    return render_template('/main_page.html')

if __name__ == '__main__':
   app.run()

#http://127.0.0.1:5000 = http://localhost:5000

