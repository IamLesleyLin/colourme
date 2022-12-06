import requests
import re
from bs4 import BeautifulSoup
import time
import pandas as pd
import numpy as np
import pymysql

df_50=pd.read_csv('df_50.csv')

try:
    connection = pymysql.connect(host='localhost',user='root', password='',database="colourme",cursorclass=pymysql.cursors.DictCursor)
    with connection.cursor() as cursor:
        command_table = "CREATE TABLE IF NOT EXISTS df50(numbers CHAR(8) NOT NULL,id CHAR(6) NOT NULL,imgURL VARCHAR(150) NOT NULL,PRIMARY KEY(numbers))"
        cursor.execute(command_table)

        command_insert = "INSERT INTO df50(numbers,id,imgURL)VALUES(%s, %s, %s)"

        for i in df_50.index:
            cursor.execute(
                command_insert, (df_50.loc[i,'productID'], df_50.loc[i,'colorID'], df_50.loc[i,'imgURL']))
    connection.commit()
    connection.close()
except Exception as ex:
    print(ex)