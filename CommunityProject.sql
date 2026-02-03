-- User  테이블 생성

DROP TABLE USERS;
CREATE TABLE USERS(
    NO NUMBER,
    ID VARCHAR2(20) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    NICKNAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE
);

ALTER TABLE USERS ADD CONSTRAINT USERS_NO_PK PRIMARY KEY(NO);
ALTER TABLE USERS ADD CONSTRAINT USERS_ID_UK UNIQUE(ID);
ALTER TABLE USERS ADD CONSTRAINT USERS_NICKNAME_UK UNIQUE(NICKNAME);


DROP SEQUENCE USERS_SEQ;
CREATE SEQUENCE USERS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

select * from users;
delete from users;
insert into users values(0, 'admin', 'admin', '관리자', 'ohjh4875@gmail.com', sysdate);
update users set email = 'admin@arsenalFC.com' where no = 0;
commit;
-- **************************

drop table board;
create table board(
    no number,
    title varchar2(100) not null,
    content varchar2(500) not null,
    reg_date date default sysdate,
    goodPoint number default 0,
    badPoint number default 0,
    users_id VARCHAR2(20) NOT NULL
);

ALTER TABLE board ADD CONSTRAINT board_NO_PK PRIMARY KEY(NO);
ALTER TABLE board ADD CONSTRAINT board_users_id_FK FOREIGN key(users_id) references users(id);

DROP SEQUENCE board_SEQ;
CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

select * from board;

-- *********************************

-- 댓글 테이블 생성
CREATE TABLE Reply (
    no NUMBER PRIMARY KEY,               
    board_no NUMBER NOT NULL,             
    users_id VARCHAR2(50) NOT NULL,       
    content VARCHAR2(1000) NOT NULL,      
    reg_date DATE DEFAULT SYSDATE   
);
    alter table reply add CONSTRAINT fk_reply_board FOREIGN KEY (board_no) 
        REFERENCES Board(no) ON DELETE CASCADE;
    alter table reply add CONSTRAINT fk_reply_user FOREIGN KEY (users_id) 
        REFERENCES Users(id);
-- 댓글 번호 자동 생성을 위한 시퀀스
CREATE SEQUENCE seq_reply_no NOCACHE;

select * from reply;


-- *************************************
-- 프로필 사진 추가 기능
DROP TABLE ProfileIMG;
CREATE TABLE ProfileIMG(
    ID NUMBER(5),
    URL VARCHAR2(300),
    users_id VARCHAR2(20),
    PRIMARY KEY (ID),
    constraint profileIMG_usersId_fk FOREIGN KEY(users_id) references users(id)
);
DROP SEQUENCE ProfileIMG_SEQ;
CREATE SEQUENCE ProfileIMG_SEQ
START WITH 1
INCREMENT BY 1;

select * from ProfileIMG;

delete from ProfileIMG where id = 7;

commit;


create or replace trigger profileImg_trg
    after INSERT
    ON users FOR EACH ROW
BEGIN
    insert into ProfileIMG values(ProfileIMG_SEQ.nextval, 'defaultIMG.jpg', :new.id);
END;
/

create or replace trigger profileImgUpdate_trg
    before INSERT
    ON profileImg FOR EACH ROW
BEGIN
    delete from profileImg where users_id = :new.users_id;
END;
/

