def update_data(phone_book):

    print("\n[연락처 수정]")
    
    search_name = input("수정할 이름 : ")
    
    for person in phone_book:

        if person["name"] == search_name:
          
            print("현재 전화 :", person["phone"])
            print("현재 주소 :", person["address"])
            
            person["phone"] = input("새 전화번호 : ")
            person["address"] = input("새 주소 : ")
            
            print("수정 완료")
            return
    print("해당 이름이 없습니다.")
    