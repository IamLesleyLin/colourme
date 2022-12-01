from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_sneaker():
   print('Sneaker recommand')
   return 'Hello Sneaker'

if __name__ == '__main__':
   app.run()

#http://127.0.0.1:5000 = http://localhost:5000

