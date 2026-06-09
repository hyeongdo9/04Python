def insert_data(phone_book):

    print("\n[연락처 입력]")
    
    name = input("이름 : ")
    phone = input("전화번호 : ")
    address = input("주소 : ")
    
    person = {
      "name": name,
      "phone": phone,
      "address": address
    }
    
    phone_book.append(person)
    
    print("입력 완료")  