import pymysql
from selenium import webdriver
import time
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import pandas as pd

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

driver = webdriver.Chrome()
hot=[]
for i in html:
    driver.get(i)
    time.sleep(5)
    w=driver.find_elements(By.XPATH,"//span[@class='ins-dynamic-element-tag ins-dynamic-attribute']")
    if w != list():
        for k in w:
            print(k.text)
            hot.append(k.text)
    else:
        print('0')
        hot.append('0')

df_hotlist=pd.DataFrame(hot,columns=['hot'])
df_hot=df_50.drop(columns='imgURL')
df_hot=pd.concat([df_hot,df_hotlist],axis=1)
df_hot


try:
    connection = pymysql.connect(host='localhost',user='root', password='',database="colourme",cursorclass=pymysql.cursors.DictCursor)
    with connection.cursor() as cursor:
        command_table = "CREATE TABLE IF NOT EXISTS parser_Hot_list(numbers CHAR(8) NOT NULL,id CHAR(6) NOT NULL,Hot INT(5) NOT NULL)"
        cursor.execute(command_table)

        command_insert = "INSERT INTO parser_Hot_list(numbers,id,hot)VALUES(%s, %s, %s)"

        for i in range(len(df_hot.index)):
            cursor.execute(
            command_insert, (df_hot.loc[i,'productID'], df_hot.loc[i,'colorID'], df_hot.loc[i,'hot']))
    connection.commit()
    connection.close()
except Exception as ex:
    print(ex)