from dbConnection import get_connection

def insert_data():
    name = input("이름 : ")
    phone = input("전화번호 : ")
    address = input("주소 : ")
    
    conn = get_connection()
    cursor = conn.cursor()
    
    sql = """
    INSERT INTO phonebooks
    (name, phone, address)
    VALUES(%s, %s, %s)
    """
    
    cursor.execute(
      sql,
      (name, phone, address)  
    )
    
    conn.commit()
    
    cursor.close()
    conn.close()
    
    print("입력 완료")
    
def show_all():

        conn = get_connection() 
        cursor = conn.cursor()
        
        sql = "SELECT * FROM phonebooks"  
        
        cursor.execute(sql)
        
        rows = cursor.fetchall()
        
        if len(rows) == 0:

            print("데이터없음") 
        else:
            for row in rows:

                print("\n번호 :", row[0])
                print("이름 :", row[1])
                print("전화 :", row[2])
                print("주소 :", row[3])
        
        cursor.close()
        conn.close()

def search_data():
  
    search_name = input("검색할 이름 : ")
    
    conn = get_connection()
    cursor = conn.cursor()
    
    sql = """
    SELECT * FROM phonebooks WHERE name=%s
    """
    
    cursor.execute(sql, (search_name,))
    
    row = cursor.fetchall()
    
    if row:
        
        print("\n번호 :", row[0])
        print("이름 :", row[1])
        print("전화 :", row[2]) 
        print("주소 :", row[3])
        
    else:
        print("검색 결과 없음")
    
    cursor.close()
    conn.close()
    
def update_data(): 
        