def show_all(phone_book):

    print("\n[전체 연락처 출력]")
    
    if len(phone_book) == 0:
        print("등록된 연락처가 없습니다.")
        return
      
    for idx, person in enumerate(phone_book, start=1):

        print(f"\n[{idx}]")
        print("이름 :", person["name"])
        print("전화 :", person["phone"])
        print("주소 :", person["address"])
        
        