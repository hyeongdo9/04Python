/*
MariaDB에서 새로운 데이터베이스의 계정 생성하기
: 오라클에서는 계정만 생성하면 되지만 MYSQL(MariaDB)
에서는 DB 와 User(사용자계정)을 동시에 생성한 후 
권한 설정을 해야한다.
*/

## 아래 작업은 root 계정으로 접속한 후 실행해야한다. ##
# 새로운 데이터베이스 생성
CREATE DATABASE sample_db;
# 새로운 사용자계정 생성(로컬에서만 접속할 수 있게 설정)
CREATE USER 'sample_user'@'localhost' IDENTIFIED BY '1234';
# sample_db를 사용할 수 있는 모든 권한을 sample_user에게 부여한다.
GRANT ALL PRIVILEGES ON sample_db.* TO 'sample_user'@'localhost';
# 이 명령을 통해 위에서 설정한 사항을 MariaDB에 적용
FLUSH PRIVILEGES;

/*
실행방법
F9 : 현재 문서의 전체 쿼리문을 한꺼번에 실행
Ctrl+F9 : 블럭으로 지정한 쿼리문만 실행.
	만약 쿼리문의 절반정도만 선택했다면, 실행시 에러가 발생한다.
Ctrl+Shift+F9 : 현재 쿼리를 실행한다. 단 마지막에 작성한
	문장의 세미콜론 안으로 커서를 옮긴 후 실행해야한다.
*/

SELECT * FROM board;
SELECT * FROM books;
SELECT * FROM guestbook;


###############################################################
## 여기서부터는 sample_user 계정으로 접속한 후 작성합니다. ##
/*
AUTO_INCREMENT
	: 자동증가 컬럼으로 지정한다. 오라클에서 사용하는 Sequnce(시퀀스)
	와 동일한 역할로, 1씩 증가하는 순차적인 정수값을 자동으로 생성 후
	입력한다.
UNSIGNED
	: 정수형 컬럼으로 지정하는 경우 음수는 사용하지 않고, 양수의 범위만
	사용한다. 이때 양의 범위가 2배로 늘어난다.
*/
CREATE TABLE tb_int (
	/* 일련번호 */
   idx INT PRIMARY KEY AUTO_INCREMENT,
	/* 정수형 */
	num1 TINYINT UNSIGNED NOT NULL,
	num2 SMALLINT NOT NULL,
	num3 MEDIUMINT DEFAULT '100',
	num4 BIGINT ,
	/* 실수형 */
	fnum1 FLOAT(10,5) NOT NULL,
	fnum2 DOUBLE(20,10)
);
DESC tb_int;

/*
레코드  입력하기
형식1 : 일련번호인 idx컬럼은 insert문에서 생략하고 작성한다.
	자동증가 컬럼으로 지정되었으므로 번호는 자동으로 부여된다.
*/
INSERT INTO tb_int (num1,num2,num3,num4,fnum1,fnum2)
VALUES (123, 12345, 1234567, 1234567890,
        12345.12345, 1234567890.1234567890);
/*
형식2 : insert문 작성시 컬럼을 명시하지 않으면 전체 컬럼에 대해 
	입력값을 작성해야한다. 단 이경우 일련번호가 중복되어 에러가
	발생할 수 있으므로 권장하지 않는다.
*/
INSERT INTO tb_int
VALUES (2, 123, 12345, 1234567, 1234567890,
        12345.12345, 1234567890.1234567890);



# 2. 날짜형으로 구성된 테이블
/*
CURRENT_TIMESTAMP : 날짜형식으로 지정된 컬럼에 디폴트값으로 현재시각을
	입력해준다.
NOW() : 날짜형식으로 지정된 컬럼에 현재시각을 입력할 때 사용하는 함수로,
	초단위까지 시간이 입력된다. 오라클의 sysdate와 동일한 역할을 한다.
*/
CREATE TABLE tb_date (
		idx INT PRIMARY KEY AUTO_INCREMENT, 
		
		DATE1 DATE NOT NULL,
		DATE2 DATETIME DEFAULT CURRENT_TIMESTAMP
);
DESC tb_date; 

# now() 함수를 통해 현재시각 입력
INSERT INTO tb_date (DATE1, DATE2) VALUES ('2023-02-25', NOW());
# 쿼리문 작성시 컬럼을 생략하면 default값이 입력됨
INSERT INTO tb_date (DATE1) VALUES ('2023-02-27');
SELECT * FROM tb_date;


# 3. 문자형으로 구성된 테이블
/*
VARCHAR(n) : 문자타입으로 짧은글을 저장할때 사용한다.
	(게시판의 제목)
TEXT : 긴 글을 저장할때 사용(게시판의 내용)
*/
CREATE TABLE tb_string (
	idx INT PRIMARY KEY AUTO_INCREMENT, 
	
	str1 VARCHAR(30) NOT NULL,
	str2 TEXT 
);
DESC tb_string;

INSERT INTO tb_string (str1, str2) VALUES ('난 짧은글3', '난 엄청 긴글3');

SELECT * FROM tb_string;
# 레코드 조회시 조건 추가하기
SELECT * FROM tb_string WHERE idx=1;
SELECT * FROM tb_string WHERE idx=1 AND str1='난 짧은글2';
SELECT * FROM tb_string WHERE idx=1 AND str1='난 짧은글3';
SELECT * FROM tb_string WHERE idx=1 OR str1='난 짧은글3';
#문자열이 포함된것을 인출하고 싶다면 like절 사용
SELECT * FROM tb_string WHERE str1 LIKE '%난 짧은%';
SELECT * FROM tb_string WHERE str1 LIKE '난 짧은%';
SELECT * FROM tb_string WHERE str1 LIKE '%난 짧은';


# 4. 특수형
/*
ENUM : 여러 항목 중 1개만 선택할 수 있는 자료형
SET : 여러 항목 중 2개 이상을 선택할 수 잇는 자료형
오라클의 check 제약조건과 비슷하다.
*/
CREATE TABLE tb_spec ( 
	idx INT AUTO_INCREMENT, 
	spec1 ENUM('M','W','T'),
	spec2 SET('A','B','C','D'),
	PRIMARY KEY (idx)
);
DESC tb_spec;

# 설정된 값만 추가했으므로 정상입력됨
INSERT INTO tb_spec (spec1, spec2) VALUES ('W', 'A,B,C');

INSERT INTO tb_spec (spec1, spec2) VALUES 
		('X', 'A,B,C'); # spec1 에러발생
INSERT INTO tb_spec (spec1, spec2) VALUES 
		('M', 'X,B,C'); # spec2 에러발생

INSERT INTO tb_spec (spec2) VALUES ('B,C,D'); 
SELECT * FROM tb_spec;



CREATE TABLE board 
(
	num INT NOT NULL AUTO_INCREMENT, /* 일련번호(자동증가) */
	title VARCHAR(100) NOT NULL, /*제목:짧은텍스트*/
	content TEXT NOT NULL, /*내용:긴텍스트*/
	id VARCHAR(30) NOT NULL, /*작성일. 현재시각을 디폴트 값으로 설정.*/
	postdate DATETIME DEFAULT CURRENT_TIMESTAMP,
	visitcount MEDIUMINT NOT NULL DEFAULT 0, /*조회수*/
	PRIMARY KEY (num)
);

INSERT INTO board (title, content, id, visitcount) VALUES
('첫 번째 공지사항입니다.', '안녕하세요. 자유게시판에 오신 것을 환영합니다. 매너를 지켜주세요.', 'admin', 15),
('두 번째 질문이 있습니다.', 'MariaDB에서 더미 데이터를 넣는 가장 좋은 방법이 무엇인가요?', 'user01', 3),
('세 번째 오늘 날씨 좋네요.', '주말인데 다들 뭐 하시나요? 맛있는 거 추천해주세요.', 'hong77', 42),
('네 번째 게시판 테스트', '웹 프로젝트 연동 게시판 기능 구현 중입니다. 잘 작동하네요.', 'developer_kim', 0),
('다섯 번째 추천 도서 목록', '개발자라면 꼭 읽어야 할 필독서 공유합니다. 댓글로 추가해주세요.', 'bookworm', 8);
INSERT INTO board (title, content, id, postdate, visitcount) VALUES
('과거 날짜 데이터 예시', '내용입니다.', 'test_user', '2026-05-01 14:30:00', 5);
SELECT * FROM board;

#########################################
#미니프로젝트 폰북 만들기
CREATE TABLE phonebooks (
idx INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
phone VARCHAR(20)	NOT NULL, 
address VARCHAR(100) 
);

USE sample_db;
SHOW TABLES;








