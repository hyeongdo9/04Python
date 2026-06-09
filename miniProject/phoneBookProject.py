from menu import show_menu
from insert import insert_data
from output import show_all
from search import search_data
from update import update_data
from delete import delete_data

# 전화번호부 저장용 리스트 
phone_book = []

while True:
    
    show_menu()
    
    choice = input("메뉴 선택 : ")
    
    if choice == "1":
        insert_data(phone_book)
    
    elif choice == "2":
        show_all(phone_book)
    
    elif choice == "3":
        search_data(phone_book)
        
    elif choice == "4":
        update_data(phone_book)
        
    elif choice == "5":
        delete_data(phone_book)
    
    elif choice == "6":
        print("프로그램 종료")
        break
      
    elif choice == "6":
        print("프로그램 종료")
        break