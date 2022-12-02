from flask import Flask
from flask import Flask, jsonify, render_template #模板套件,
from flask import request #解析套件
#from flask_cors import CORS


app = Flask(__name__)
app.config["JSON_AS_ASCII"] = False
#CORS(app, resources={r"./*":{"origins":["http://127.0.0.1:5500"]}})

@app.route('/sss',methods=['GET'])
def home():
    return render('../web/main_page.html')

if __name__ == '__main__':
   app.run()

#http://127.0.0.1:5000 = http://localhost:5000

