from __future__ import unicode_literals
from flask import Flask, request, abort, render_template
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

from urllib import parse
app = Flask(__name__, static_url_path='/static')
UPLOAD_FOLDER = 'static'
ALLOWED_EXTENSIONS = set(['pdf', 'png', 'jpg', 'jpeg', 'gif'])


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

                if text == "我的名字":
                    payload["messages"] = [getNameEmojiMessage()]
                elif text == "捷運的聲音":
                    payload["messages"] = [getMRTSoundMessage()]
                elif text == "出去玩囉":
                    payload["messages"] = [getPlayStickerMessage()]
                elif text == "台北101":
                    payload["messages"] = [getTaipei101ImageMessage(),
                                           getTaipei101LocationMessage(),
                                           getMRTVideoMessage()]
                elif text == "quota":
                    payload["messages"] = [
                            {
                                "type": "text",
                                "text": getTotalSentMessageCount()
                            }
                        ]
                elif text == "今日確診人數":
                    payload["messages"] = [
                            {
                                "type": "text",
                                "text": getTodayCovid19Message()
                            }
                        ]
                elif text == "主選單":
                    payload["messages"] = [
                            {
                                "type": "template",
                                "altText": "This is a buttons template",
                                "template": {
                                  "type": "buttons",
                                  "title": "Menu",
                                  "text": "Please select",
                                  "actions": [
                                      {
                                        "type": "message",
                                        "label": "我的名字",
                                        "text": "我的名字"
                                      },
                                      {
                                        "type": "message",
                                        "label": "今日確診人數",
                                        "text": "今日確診人數"
                                      },
                                      {
                                        "type": "uri",
                                        "label": "聯絡我",
                                        "uri": f"tel:{my_phone}"
                                      }
                                  ]
                              }
                            }
                        ]
                else:
                    payload["messages"] = [
                            {
                                "type": "text",
                                "text": text
                            }
                        ]
                replyMessage(payload)
            elif events[0]["message"]["type"]=="image":
                payload["messages"] = [getMessageImage()]
                replyMessage(payload)
            elif events[0]["message"]["type"] == "location":
                title = events[0]["message"]["title"]
                latitude = events[0]["message"]["latitude"]
                longitude = events[0]["message"]["longitude"]
                payload["messages"] = [getLocationConfirmMessage(title, latitude, longitude)]
                replyMessage(payload)
        elif events[0]["type"] == "postback":
            if "params" in events[0]["postback"]:
                reservedTime = events[0]["postback"]["params"]["datetime"].replace("T", " ")
                payload["messages"] = [
                        {
                            "type": "text",
                            "text": f"已完成預約於{reservedTime}的叫車服務"
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
                    payload["messages"] = [getTaipei101ImageMessage(),
                                           getTaipei101LocationMessage(),
                                           getMRTVideoMessage(),
                                           getCallCarMessage(data)]
                replyMessage(payload)

    return 'OK'


@app.route("/callback", methods=['POST'])
def callback():
    signature = request.headers['X-Line-Signature']
    body = request.get_data(as_text=True)
    app.logger.info("Request body: " + body)

    try:
        handler.handle(body, signature)

    except InvalidSignatureError:
        abort(400)

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
                        "label": "101白天",
                        "data": json.dumps(data)
                        }
                },
                {
                    "imageUrl": f"{end_point}/static/taipei_1.jpeg",
                    "action": {
                        "type": "postback",
                        "label": "101夜晚",
                        "data": json.dumps(data)
                        }
                }]
                }
                }
    return message


def getLocationConfirmMessage(title, latitude, longitude):
    data = {'title':title, 'latitude':latitude, 'longitude':longitude, 'action':'get_near'}
    print(data)
    message = {
        "type": "template",
        "altText": "this is a confirm template",
        "template": {
            "type": "confirm",
            "text": f"是否要規劃{title}附近的行程",
            "actions": [{
                "type": "postback",
                "label": "Yes",
                "data": json.dumps(data)
                },
                {
                "type": "message",
                "label": "No",
                "text": "no"
                }]
        }
    }
    return message


def getCallCarMessage(data):
    message = {
        "type": "template",
        "altText": "This is a buttons template",
        "template": {
            "type": "buttons",
            "text": f"請選擇至{data['title']}的預約叫車時間",
            "actions":[{
                "type": "datetimepicker",
                "label": "請選擇時間",
                "data": json.dumps(data),
                "mode": "datetime"
            }]
        }
    }
    return message


def getPlayStickerMessage():
    message = {"type":"sticker","packageId":"446", "stickerId":"1988"}
    # print(message)
    return message


def getTaipei101LocationMessage():
    message = dict()
    message['type'] = 'location'
    message['title'] = '台北101'
    message['address'] = 'No 20, Xinyi Rd, Section 5, Xinyi District, 110, Taipei City'
    message['latitude'] = 25.041460299999997
    message['longitude'] = 121.57281100000002
    return message


def getMRTVideoMessage():
    message = dict()
    message["type"] = "video"
    message["originalContentUrl"] = f"{end_point}/static/taipei_101_video.mp4"
    message["previewImageUrl"] = f"{end_point}/static/taipei_1.jpeg"
    return message


def getMRTSoundMessage():
    message = dict()
    message["type"] = "audio"
    message["originalContentUrl"] = f"{end_point}/static/mrt_sound.m4a"
    import audioread
    with audioread.audio_open('static/mrt_sound.m4a') as f:
        # totalsec contains the length in float
        totalsec = f.duration
    message["duration"] = totalsec * 1000
    return message


def getTaipei101ImageMessage(originalContentUrl=f"{end_point}/static/taipei_101.jpeg"):
    return getImageMessage(originalContentUrl)


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
        image_content = line_bot_api.get_message_content(img_data['events'][0]['message']['id'])
        
        img_read = []
        for i_content in image_content.iter_content():
            img_read.append(i_content)

        for i in img_read:
            img_decoded = cv2.imdecode(np.frombuffer(i, np.uint8), 1)
            img_gray = cv2.cvtColor(img_decoded, cv2.COLOR_BGR2GRAY)
            print(img_gray.shape)

        

        # img_decoded = cv2.imdecode(np.frombuffer(img_read, np.uint8), 1)
        # img_gray = cv2.cvtColor(img_decoded, cv2.COLOR_BGR2GRAY)
        # print(img_gray.shape)
        
   

    # if request.method == 'POST':
    #     image_name = ''.join(random.choice(string.ascii_letters + string.digits) for x in range(4))
    #     image_content = line_bot_api.get_message_content(img_data['events'][0]['message']['id'])
    #     image_name = image_name.upper()+'.jpg'
    #     path='./static/'+ image_name
    #     with open(path, 'wb') as fd:
    #         for chunk in image_content.iter_content():
    #             fd.write(chunk)
    #     img = request.files.image_content
    #     img_read = img.stream.read()
    #     img_decoded = cv2.imdecode(np.frombuffer(img_read, np.uint8), 1)
    #     img_gray = cv2.cvtColor(img_decoded, cv2.COLOR_BGR2GRAY)
    #     print(img_gray.shape)
# def image_processing_1(image_name,image_path):
#     #讀取照片原圖
#     img = cv2.imread(image_path)
    
#     #將原圖轉為灰階圖
#     gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
    
#     #將灰階圖進行二值化處理
#     ret,binary=cv.threshold(gray,127,255,cv.THRESH_BINARY)
    
#     #將灰階圖與二值化處理圖存為實體檔案
#     gray_path = './static/gray_'+image_name
#     binary_path = './static/binary_'+image_name
#     cv.imwrite(gray_path,gray)
#     cv.imwrite(binary_path,binary)

#     return gray_path, binary_path
# if request.method == 'POST':
#         img = request.files.image_content
#         img_read = img.stream.read()
#         img_decoded = cv2.imdecode(np.frombuffer(img_read, np.uint8), 1)
#         img_gray = cv2.cvtColor(img_decoded, cv2.COLOR_BGR2GRAY)
#         print(img_gray.shape)
#         # if img.filename != '':
#         #     img.save(os.path.join(pathlib.Path(__file__).parent.absolute(), img.filename))
#         return redirect(url_for('main_page'))


def replyMessage(payload):
    r = requests.post('https://api.line.me/v2/bot/message/reply', data=json.dumps(payload), headers=HEADER)
    print(r.content)
    return 'OK'


def pushMessage(payload):
    r = requests.post('https://api.line.me/v2/bot/message/push', data=json.dumps(payload), headers=HEADER)
    print(r.content)
    return 'OK'


def getTotalSentMessageCount():
    r = requests.get('https://api.line.me/v2/bot/message/quota/consumption', headers=HEADER)
    return f"總共使用訊息:{r.json()['totalUsage']}"


def getTodayCovid19Message():
    r = requests.get("https://covid-19.nchc.org.tw/api/covid19?CK=covid-19@nchc.org.tw&querydata=4051&limited=TWN")
    data = r.json()[-1]
    date = data["a04"]
    total_count = data["a05"]
    count = data["a06"]
    return F"日期：{date}, 人數：{count}, 確診總人數：{total_count}"


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS


@app.route('/upload_file', methods=['POST'])
def upload_file():
    payload = dict()
    if request.method == 'POST':
        file = request.files['file']
        print("json:", request.json)
        form = request.form
        age = form['age']
        gender = ("男" if form['gender'] == "M" else "女") + "性"
        if file:
            filename = file.filename
            img_path = os.path.join(UPLOAD_FOLDER, filename)
            file.save(img_path)
            print(img_path)
            payload["to"] = my_line_id
            payload["messages"] = [getImageMessage(f"{end_point}/{img_path}"),
                {
                    "type": "text",
                    "text": f"年紀：{age}\n性別：{gender}"
                }
            ]
            pushMessage(payload)
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
