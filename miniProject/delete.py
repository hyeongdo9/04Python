def delete_data(phone_book):

    print("\n[연락처 삭제]")
    
    search_name = input("삭제할 이름 : ")
    
    for person in phone_book:

        if person["name"] == search_name:
          
            phone_book.remove(person)
            
            print("삭제 완료")
            return
    
    print("해당 이름이 없습니다.")
    