from __future__ import unicode_literals
from flask import Flask, request, abort, render_template
from flask_cors import CORS
from linebot import LineBotApi, WebhookHandler
from linebot.exceptions import InvalidSignatureError
from linebot.models import MessageEvent, TextMessage, TextSendMessage
import requests
import json
import configparser
import os
import string
import random
import cv2
import numpy as np
import base64
import io
from urllib import parse
from keras.models import load_model
import pymysql



app = Flask(__name__, static_url_path='/static')


UPLOAD_FOLDER = 'static'
ALLOWED_EXTENSIONS = set(['pdf', 'png', 'jpg', 'jpeg', 'gif'])

db = pymysql.connect(
            host='localhost',
            port=3306,
            user='root',
            passwd='',
            database='colourme',
            charset='utf8mb4',
        )
config = configparser.ConfigParser()
config.read('config.ini')

line_bot_api = LineBotApi(config.get('line-bot', 'channel_access_token'))
handler = WebhookHandler(config.get('line-bot', 'channel_secret'))
my_line_id = config.get('line-bot', 'my_line_id')
end_point = config.get('line-bot', 'end_point')
line_login_id = config.get('line-bot', 'line_login_id')
line_login_secret = config.get('line-bot', 'line_login_secret')
my_phone = config.get('line-bot', 'my_phone')
HEADER = {
    'Content-type': 'application/json',
    'Authorization': F'Bearer {config.get("line-bot", "channel_access_token")}'
}


@app.route("/", methods=['POST', 'GET'])
def index():
    if request.method == 'GET':
        return 'ok'
    body = request.json
    events = body["events"]
    print(body)
    if "replyToken" in events[0]:
        payload = dict()
        replyToken = events[0]["replyToken"]
        payload["replyToken"] = replyToken
        if events[0]["type"] == "message":
            if events[0]["message"]["type"] == "text":
                text = events[0]["message"]["text"]

                if text == "About Us":
                    payload["messages"] = [getMessageAboutUS()]
                elif text == "Contact Us":
                    payload["messages"] = [getMessageContactUs()]
                elif text == "????????????":
                    payload["messages"] = [getMessagePIC()]
                elif text == "??????":
                    payload["messages"] = [getMessageSite()]
                elif text == "??????":
                    payload["messages"] = [turnPicnNegative()]
                elif text == "??????":
                    payload["messages"] = [turnPicnGray()]
                elif text == "??????":
                    payload["messages"] = [turnPicnFlip()]
                elif text == "rescale":
                    payload["messages"] = [turnPicnRescale()]
                elif text == "????????????":
                    payload["messages"] = [turnPicnDelete()]
                elif text == "????????????":
                    payload["messages"] = [sizeMessagePIC()]
                elif text == "????????????":
                    payload["messages"] = [searchMessagePIC()]
                    
                elif text == "?????????":
                    payload["messages"] = [
                            {
                                "type": "template",
                                "altText": "This is a buttons template",
                                "template": {
                                  "type": "buttons",
                                  "title": "?????????",
                                  "text": "Please select",
                                  "actions": [
                                      {
                                        "type": "message",
                                        "label": "????????????",
                                        "text": "????????????"
                                        },
                                        {
                                        "type": "message",
                                        "label": "????????????",
                                        "text": "????????????"
                                        },
                                        {
                                        "type": "message",
                                        "label": "????????????",
                                        "text": "????????????"
                                        },
                                        {
                                        "type": "message",
                                        "label": "????????????",
                                        "text": "????????????"
                                        }]}}]    
                elif text == "????????????":
                    payload["messages"] = [
                            {
                                "type": "template",
                                "altText": "This is a buttons template",
                                "template": {
                                  "type": "buttons",
                                  "title": "????????????",
                                  "text": "Please select",
                                  "actions": [
                                      {
                                        "type": "message",
                                        "label": "??????",
                                        "text": "??????"
                                        },
                                        {
                                        "type": "message",
                                        "label": "??????",
                                        "text": "??????"
                                        },
                                        {
                                        "type": "message",
                                        "label": "??????",
                                        "text": "??????"
                                        },
                                        {
                                        "type": "message",
                                        "label": "????????????",
                                        "text": "rescale"
                                        }]}}]
                else:
                    payload["messages"] = [
                            {
                                "type": "text",
                                "text": text
                            }
                        ]
                replyMessage(payload)
            elif events[0]["message"]["type"]=="image":
                payload["messages"] = [
                            # {
                                # "type": "text",
                                getMessageImage()
                            # }
                        ]
                replyMessage(payload)
        elif events[0]["type"] == "postback":
            if "params" in events[0]["postback"]:
                reservedTime = events[0]["postback"]["params"]["datetime"].replace("T", " ")
                payload["messages"] = [
                        {
                            "type": "text",
                            "text": f"??????????????????{reservedTime}???????????????"
                        }
                    ]
                replyMessage(payload)
            else:
                data = json.loads(events[0]["postback"]["data"])
                action = data["action"]
                if action == "get_near":
                    data["action"] = "get_detail"
                    payload["messages"] = [getCarouselMessage(data)]
                elif action == "get_detail":
                    del data["action"]
                    payload["messages"] = [getTaipei101ImageMessage()]
                replyMessage(payload)

    return 'OK'



@handler.add(MessageEvent, message=TextMessage)
def pretty_echo(event):
    line_bot_api.reply_message(
        event.reply_token,
        TextSendMessage(text=event.message.text)
        )



@app.route("/sendTextMessageToMe", methods=['POST'])
def sendTextMessageToMe():
    pushMessage({})
    return 'OK'



def getNameEmojiMessage():
    lookUpStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    productId = "5ac21a8c040ab15980c9b43f"
    name = "Jacky"
    message = dict()
    message['type'] = 'text'
    message['text'] = "".join('$' for _ in range(len(name)))
    emoji_list = []
    for i in name:
        emoji_list.append({
            "index": str(name.index(i)),
            "productId": productId,
            "emojiId": str(lookUpStr.index(i)+1).zfill(3)
            })
    message['emojis'] = emoji_list
    # print(message)
    return message


def getCarouselMessage(data):
    message = {
         "type": "template",
        "altText": "this is a image carousel template",
        "template": {
            "type": "image_carousel",
            "columns": [
                {
                    "imageUrl": f"{end_point}/static/taipei_101.jpeg",
                    "action": {
                        "type": "postback",
                        "label": "101??????",
                        "data": json.dumps(data)
                        }
                },
                {
                    "imageUrl": f"{end_point}/static/taipei_1.jpeg",
                    "action": {
                        "type": "postback",
                        "label": "101??????",
                        "data": json.dumps(data)
                        }
                }]
                }
                }    
    return message


def getImageMessage(originalContentUrl):
    message = dict()
    message['type'] = 'image'
    message['originalContentUrl'] = str(originalContentUrl)
    message['previewImageUrl'] = str(originalContentUrl)
    return message

def getMessageImage():
    img = request.get_data(as_text=True)
    img_data = json.loads(img)
    print(img_data['events'][0]['message']['id'])

    if request.method == 'POST':
        image_name = str(img_data['events'][0]['source']['userId'])
        image = line_bot_api.get_message_content(img_data['events'][0]['message']['id'])
        image_content = image.content

        pic_out = open(f'./static/{image_name}.jpg', 'wb')  # img1.png???????????????????????????
        pic_out.write(image_content)  # ???get????????????img1.png
        pic_out.close()  # ????????????(?????????)

    message = dict()
    message['type'] = 'template' 
    message['altText'] = 'This is a buttons template'
    message['template'] =  {
                    "type": "buttons",
                    "title": "????????????",
                    "text": "Please select",
                    "actions": [{
                                "type": "message",
                                "label": "????????????",
                                "text": "????????????"
                                },
                                {
                                "type": "message",
                                "label": "????????????",
                                "text": "????????????"
                                },
                                {
                                "type": "message",
                                "label": "????????????",
                                "text": "????????????"
                                }]}
    return message

        

        # img_decoded = cv2.imdecode(np.frombuffer(image_content, np.uint8), 1)
        # img_gray = cv2.cvtColor(img_decoded, cv2.COLOR_BGR2GRAY)
        # print(img_gray.shape)
        # return f'??????????????????{str(img_gray.shape)}'

def turnPicnNegative():
    img = request.get_data(as_text=True)
    img_data = json.loads(img)
    image_name = str(img_data['events'][0]['source']['userId'])
    imgg = cv2.imread(f'./static/{image_name}.jpg')
    # imm4 = io.BytesIO(cv2.imencode('.jpg',imgg)[1]).read()
    # imdddd = base64.b64encode(imm4).decode('ascii')
    # print(imdddd)
    # img_decoded = cv2.imdecode(np.frombuffer(imgg, np.uint8), 1)
    # img_gray = cv2.cvtColor(img_decoded, cv2.COLOR_BGR2GRAY)
    # print(imgg)
    img_negative = 255 - imgg
    cv2.imwrite(f'./static/1{image_name}.jpg', img_negative)
    # cv2.waitKey(0)
    # cv2.destroyAllWindows()

    message = dict()
    message['type'] = 'image'
    message['originalContentUrl'] = f"{end_point}/static/1{image_name}.jpg"
    message['previewImageUrl'] = f"{end_point}/static/1{image_name}.jpg"
    return message
    # img_negative_tolist = img_negative.tolist()
    # imm = json.dumps(img_negative_tolist)
    # print(imm)
def sizeMessagePIC():
    img = request.get_data(as_text=True)
    img_data = json.loads(img)
    image_name = str(img_data['events'][0]['source']['userId'])
    imgg = cv2.imread(f'./static/{image_name}.jpg')
    img_gray = cv2.cvtColor(imgg, cv2.COLOR_BGR2GRAY)
    print('222')
    print(img_gray.shape)
    print('222')
    message = dict()
    message['type'] = 'text'
    message['text'] =f'??????????????????{(img_gray.shape)}'
    
    return message

def turnPicnGray():
    img = request.get_data(as_text=True)
    img_data = json.loads(img)
    image_name = str(img_data['events'][0]['source']['userId'])
    imgg = cv2.imread(f'./static/{image_name}.jpg')
    img_gray = cv2.cvtColor(imgg, cv2.COLOR_BGR2GRAY)
    cv2.imwrite(f'./static/2{image_name}.jpg', img_gray)
    message = dict()
    message['type'] = 'image'
    message['originalContentUrl'] = f"{end_point}/static/2{image_name}.jpg"
    message['previewImageUrl'] = f"{end_point}/static/2{image_name}.jpg"
    return message

def turnPicnFlip():
    img = request.get_data(as_text=True)
    img_data = json.loads(img)
    image_name = str(img_data['events'][0]['source']['userId'])
    imgg = cv2.imread(f'./static/{image_name}.jpg')
    image2 = cv2.flip(imgg, 1)
    cv2.imwrite(f'./static/3{image_name}.jpg', image2)
    message = dict()
    message['type'] = 'image'
    message['originalContentUrl'] = f"{end_point}/static/3{image_name}.jpg"
    message['previewImageUrl'] = f"{end_point}/static/3{image_name}.jpg"
    return message

def turnPicnRescale():
    img = request.get_data(as_text=True)
    img_data = json.loads(img)
    image_name = str(img_data['events'][0]['source']['userId'])
    imgg = cv2.imread(f'./static/{image_name}.jpg')
    image = cv2.resize(imgg,None, fx=0.5,fy=0.5 , interpolation=cv2.INTER_AREA)
    cv2.imwrite(f'./static/4{image_name}.jpg', image)
    message = dict()
    message['type'] = 'image'
    message['originalContentUrl'] = f"{end_point}/static/4{image_name}.jpg"
    message['previewImageUrl'] = f"{end_point}/static/4{image_name}.jpg"
    return message

def turnPicnDelete():
    img = request.get_data(as_text=True)
    
    img_data = json.loads(img)
    image_name = str(img_data['events'][0]['source']['userId'])
    imgg = cv2.imread(f'./static/{image_name}.jpg')
    if os.path.exists(f'./static/{image_name}.jpg'):
        os.remove(f'./static/{image_name}.jpg')
        print('????????????')
    else :
        print('????????????')

def searchMessagePIC():
    app = Flask(__name__)
    model = load_model('./static/model_forLINE.h5')
    CORS(app, resources={r"./*":{"origins":["*"]}})
    img = request.get_data(as_text=True)
    img_data = json.loads(img)
    image_name = str(img_data['events'][0]['source']['userId'])
    imgg = cv2.imread(f'./static/{image_name}.jpg')
    img_gray = cv2.cvtColor(imgg, cv2.COLOR_BGR2GRAY)
    imagg = cv2.resize(img_gray, (100 , 100) , interpolation=cv2.INTER_AREA)
    imgggg = imagg.flatten()
    df=imgggg
    df[ df == np.argmax(np.bincount(df))]= 255
    img_re = df.reshape(-1,100,100,1)
    img_pre = model.predict(img_re)
    no = np.argmax(img_pre[0])
    print(no)
    cursor = db.cursor()
    select_sql = f"""SELECT `category`.`numbers`,`category`.`id`,`category`.`name`,`category`.`text`,`category`.`price`,`productid_imgurl`.`imgURL`
                        FROM ((`productid_imgurl` 
                        LEFT JOIN `category`
                        ON `category`.`numbers`= `productid_imgurl`.`numbers`) 
                        RIGHT JOIN `model_label_50` ON `model_label_50`.`numbers`= `productid_imgurl`.`numbers`)
                        WHERE `model_label_50`.`label`= {no}"""
    cursor.execute(select_sql)
    if cursor.rowcount > 0:
        results = cursor.fetchall()
        # print(results)

        result_list = []
        for i in results:
            numbers = i[0]
            ids = i[1]
            # names = " ".join(re.findall("\w+\s+", i[2]))
            names = i[2]
            text = i[3]
            price = i[4]
            url = i[5]

            result_list.append({"numbers": numbers,"ids": ids, "names": names,"text":text, "price":price, "url": url})
        a = result_list[0]['url']
        print(a)
    cursor.close()
    message = dict()
    message['type'] = 'image'
    message['originalContentUrl'] =  f"{a}"
    message['previewImageUrl'] =  f"{a}"
    return  message
    
def getMessageAboutUS():
    message = dict()
    message['type'] = 'text'
    message['text'] = '???????????????????????????????????????????????????????????????'
    return message

def getMessageContactUs():
    message = dict()
    message['type'] = 'text'
    message['text'] = "????????? ??????????????? \n????????? (02)-2737-7300 \n????????? 9 AM ~ 12 PM ??? 1 PM ~ 5:30 PM \n????????? ????????????????????????????????????237???4???"
    return message

def getMessagePIC():
    message = dict()
    message['type'] = 'text'
    message['text'] = "???????????????"
    return message

def getMessageSite():
    message = dict()
    message['type'] = 'text'
    message['text'] = "?????????"
    return message


def replyMessage(payload):
    r = requests.post('https://api.line.me/v2/bot/message/reply', data=json.dumps(payload), headers=HEADER)
    print(r.content)

    return 'OK'


def pushMessage(payload):
    r = requests.post('https://api.line.me/v2/bot/message/push', data=json.dumps(payload), headers=HEADER)
    print(r.content)
    return 'OK'





@app.route('/line_login', methods=['GET'])
def line_login():
    if request.method == 'GET':
        code = request.args.get("code", None)
        state = request.args.get("state", None)

        if code and state:
            HEADERS = {'Content-Type': 'application/x-www-form-urlencoded'}
            url = "https://api.line.me/oauth2/v2.1/token"
            FormData = {"grant_type": 'authorization_code', "code": code, "redirect_uri": F"{end_point}/line_login", "client_id": line_login_id, "client_secret":line_login_secret}
            data = parse.urlencode(FormData)
            content = requests.post(url=url, headers=HEADERS, data=data).text
            content = json.loads(content)
            url = "https://api.line.me/v2/profile"
            HEADERS = {'Authorization': content["token_type"]+" "+content["access_token"]}
            content = requests.get(url=url, headers=HEADERS).text
            content = json.loads(content)
            name = content["displayName"]
            userID = content["userId"]
            pictureURL = content["pictureUrl"]
            # statusMessage = content["statusMessage"]
            statusMessage = content.get("statusMessage", "")
            print(content)
            return render_template('profile.html', name=name, pictureURL=
                                   pictureURL, userID=userID, statusMessage=
                                   statusMessage)
        else:
            return render_template('login.html', client_id=line_login_id,
                                   end_point=end_point)


if __name__ == "__main__":
    app.debug = True
    app.run()
