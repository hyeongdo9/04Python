def search_data(phone_book):

    print("\n[연락처 검색]")
    
    search_name = input("검색할 이름 : ")
    
    for person in phone_book:
        if person["name"] == search_name:

            print("\n검색 결과")  
            print("이름 :", person["name"])
            print("전화 :", person["phone"])
            print("주소 :", person["address"])
            
            return
    print("검색 결과가 없습니다.")
            