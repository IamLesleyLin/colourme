import requests
import re
from bs4 import BeautifulSoup
import time
import pandas as pd
import numpy as np
import pymysql

df_50=pd.read_csv('df_50.csv')
df_50

select_list=[]
for i in range(len(df_50)):
    df_50.iat[i,0]
    select_list.append(df_50.iat[i,0])
select_list

html=[]
addidasUrl = 'https://www.adidas.com.tw/product/'
for i in select_list:
    k=addidasUrl + str(i)
    print(k)
    html.append(k)
df_text=pd.DataFrame(columns=['number','id','name','text','price','url'])

for i in html:
    product=requests.get(i)
    time.sleep(0.2)
    soup = BeautifulSoup(product.text, 'html.parser')
    
    
    ID=soup.find("span",{'class':'product-color-id'})
    ID=ID.text
    
    feature=soup.select('span li')
    f_list=[]
    for i in feature:
        i.text
        f_list.append(i.text)  
    
    name=soup.find("div",{'class':'product-name'})
    name=name.text

    price=soup.find("meta",{'property':'product:price:amount'})
    TWD=price['content']

    b=soup.find("meta",{'property':'og:url'})
    url=b['content']
    number=url[-8:]

    df_text=df_text.append({"id":ID,'name':name,"text":f_list,'price':TWD,'number':number,'url':url},ignore_index=True)
df_text.to_csv('df_text.csv')

try:
    connection = pymysql.connect(host='localhost',user='root', password='',database="colourme",cursorclass=pymysql.cursors.DictCursor)
    with connection.cursor() as cursor:
        command_table = "CREATE TABLE IF NOT EXISTS parser_text(numbers CHAR(8) NOT NULL,id CHAR(6) NOT NULL,name VARCHAR(30) NOT NULL,text VARCHAR(50) NULL,price INT(5) NOT NULL,url VARCHAR(150) NULL,PRIMARY KEY(numbers))"
        cursor.execute(command_table)

        command_insert = "INSERT INTO parser_text(numbers,id,name,text,price,url)VALUES(%s, %s, %s,%s,%s,%s)"

        for i in df_text.index:
            text=str(df_text.loc[i,'text'])
            text=text.replace('[','').replace(']','')
            cursor.execute(
                command_insert, (df_text.loc[i,'number'], df_text.loc[i,'id'], df_text.loc[i,'name'],text,df_text.loc[i,'price'],df_text.loc[i,'url']))
    connection.commit()
    connection.close()
except Exception as ex:
    print(ex)