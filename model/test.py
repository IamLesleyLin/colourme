from keras.models import load_model

model = load_model('my_model.h5')


img_re = img.reshape(-1,100,100,1)
img_pre = model.predict()
np.argmax(qqq[0])


     # img_encoded2 = cv2.imencode('.jpg', no)[1]
        # img_encoded3 = io.BytesIO(img_encoded2).read()

        # pic_out = open('img.jpg', 'wb')
        # pic_out.write(img_encoded3)
        # pic_out.close()

