from phoneBookFunction import *

while True:
    print("1. 입력")
    print("2. 출력")
    print("3. 검색")
    print("4. 수정")
    print("5. 삭제")
    print("6. 종료")

    choice = input("메뉴 선택 : ")

    if choice == '1':
        insert_data()
    elif choice == '2':
        show_all()
    elif choice == '3':
        search_data()
    elif choice == '4':
        update_data()
    elif choice == '5':
        delete_data()
    elif choice == '6':
        print("프로그램 종료")
        break
    else:
        print("잘못 입력했습니다.")