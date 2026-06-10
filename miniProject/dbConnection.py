import pymysql

def get_connection():


    conn = pymysql.connect(
       host='localhost',
       user='sample_user',
       password='1234',
       db='sample_db',
       charset='utf8'
    )
    
    return conn