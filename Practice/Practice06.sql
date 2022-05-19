--작가 테이블 삭제
drop table author;
--작가 시퀀스 삭제
drop sequence seq_author_id;

--작가 테이블 만들기
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

--작가 시퀀스 만들기
create sequence seq_author_id
increment by 1
start with 1
nocache;

--작가 데이터 추가
insert into author
values (seq_author_id.nextval, '이문열' , '경북 영양');

insert into author
values (seq_author_id.nextval, '박경리' , '경상남도 통영');

insert into author
values (seq_author_id.nextval, '유시민' , '17대 국회의원');

insert into author
values (seq_author_id.nextval, '기안84' , '기안동에서 산 84년생');

insert into author
values (seq_author_id.nextval, '강풀' , '온라인 만화가 1세대');

insert into author
values (seq_author_id.nextval, '김영하' , '알쓸신잡');


--작가테이블 조회하기
select *
from author;

--작가시퀀스 조회하기
select *
from user_sequences;

-------------------------------------------------------------------------------

--책 테이블 삭제
drop table book;
--책 시퀀스 삭제
drop sequence seq_book_id;

--책 테이블 만들기
create table book(
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    constraint book_fk foreign key(author_id)
    references author(author_id)
);

--책 시퀀스 만들기
create sequence seq_book_id
increment by 1
start with 1
nocache;

--책 데이터 추가
insert into book
values (seq_book_id.nextval, '우리들의 일그러진 영웅' , '다림' , '1998-02-11' , 1);

insert into book
values (seq_book_id.nextval, '삼국지' , '민음사' , '2002-03-01' , 1);

insert into book
values (seq_book_id.nextval, '토지' , '마로니에북스' , '2012-08-15' , 2);

insert into book
values (seq_book_id.nextval, '유시민의 글쓰기 특강' , '생각의길' , '2015-04-01' , 3);

insert into book
values (seq_book_id.nextval, '패션왕' , '중앙북스(books)' , '2012-02-22' , 4);

insert into book
values (seq_book_id.nextval, '순정만화' , '재미주의' , '2011-08-03' , 5);

insert into book
values (seq_book_id.nextval, '오직두사람' , '문학동네' , '2017-05-04' , 6);

insert into book
values (seq_book_id.nextval, '26년' , '재미주의' , '2012-02-04' , 5);


--책테이블 조회하기
select *
from book;

--책시퀀스 조회하기
select *
from user_sequences;

-------------------------------------------------------------------------------

--테이블 생성
select  b.book_id,
        b.title,
        b.pubs,
        to_char(b.pub_date, 'yyyy-mm-dd') pub_date,
        b.author_id,
        a.author_name,
        a.author_desc
from book b, author a
where b.author_id = a.author_id;

-- 강풀의 author_desc 정보를 ‘서울특별시’ 로 변경해 보세요
update author
set author_desc = '서울특별시'
where author_id = 5;

-- author 테이블에서 기안84 데이터를 삭제해 보세요  삭제 안됨
 book테이블의 fk에서 author테이블의 pk와 연결해 데이터를 사용하고 있어서 삭제가 안됌
 