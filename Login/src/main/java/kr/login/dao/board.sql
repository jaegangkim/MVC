--drop table member
--create table member(
--	memId varchar2(20) not null,
--	memName varchar2(30),
--	memPwd varchar2(30),
--	primary key (memId)
--);
--delete from member;
--insert into member values('smhrd01','관리자','smhrd01');
--insert into member values('smhrd02','박혜민','smhrd02');
--insert into member values('smhrd03','김유리','smhrd03');
--insert into member values('1','김유리','1');
--select * from member;
--
--create table board1(
--	num number not null,
--	memId varchar2(20) not null,
--	title varchar2(50) not null,
--	content varchar2(2000) not null,
--	writer varchar2(50) not null,
--	indate date default sysdate,
--	count number default 0,
--	primary key (num)
--	);
--	
--	SELECT title,writer FROM (SELECT * FROM board ORDER BY count DESC) WHERE ROWNUM < 6;
--select * from member;
--select * from board;

INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('mb_id 01', 'mb_pw 01', 'mb_name 01', 'mb_phone 01', 01, sysdate, 'N', 01);
INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('mb_id 02', 'mb_pw 02', 'mb_name 02', 'mb_phone 02', 02, sysdate, 'N', 02);
INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('mb_id 03', 'mb_pw 03', 'mb_name 03', 'mb_phone 03', 03, sysdate, 'N', 03);
INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('mb_id 04', 'mb_pw 04', 'mb_name 04', 'mb_phone 04', 04, sysdate, 'N', 04);
INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('mb_id 05', 'mb_pw 05', 'mb_name 05', 'mb_phone 05', 05, sysdate, 'N', 05);
INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('mb_id 06', 'mb_pw 06', 'mb_name 06', 'mb_phone 06', 06, sysdate, 'N', 06);
INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('mb_id 07', 'mb_pw 07', 'mb_name 07', 'mb_phone 07', 07, sysdate, 'N', 07);
INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('mb_id 08', 'mb_pw 08', 'mb_name 08', 'mb_phone 08', 08, sysdate, 'N', 08);
INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('mb_id 09', 'mb_pw 09', 'mb_name 09', 'mb_phone 09', 09, sysdate, 'N', 09);
INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('mb_id 10', 'mb_pw 10', 'mb_name 10', 'mb_phone 10', 10, sysdate, 'N', 10);


INSERT INTO tbl_member (mb_id, mb_pw, mb_name, mb_phone, challenge_total, mb_joindate, mb_type, mb_level) VALUES ('1', '1', '얼죽코', 'mb_phone 10', 10, sysdate, 'N', 10);


select * from tbl_member

-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- tbl_member Table Create SQL
CREATE TABLE tbl_member
(
    mb_id              VARCHAR2(20)     NOT NULL, 
    mb_pw              VARCHAR2(20)     NOT NULL, 
    mb_name            VARCHAR2(20)     NOT NULL, 
    mb_phone           VARCHAR2(20)     NOT NULL, 
    challenge_total    NUMBER(12, 0)    NOT NULL, 
    mb_joindate        DATE             NOT NULL, 
    mb_type            CHAR(1)          NOT NULL, 
    mb_level           NUMBER(12, 0)    NOT NULL, 
     PRIMARY KEY (mb_id)
)
/

COMMENT ON TABLE tbl_member IS '회원관리'
/

COMMENT ON COLUMN tbl_member.mb_id IS '회원 아이디'
/

COMMENT ON COLUMN tbl_member.mb_pw IS '회원 비밀번호'
/

COMMENT ON COLUMN tbl_member.mb_name IS '회원 이름'
/

COMMENT ON COLUMN tbl_member.mb_phone IS '회원 연락처'
/

COMMENT ON COLUMN tbl_member.challenge_total IS '챌린지 목표액'
/

COMMENT ON COLUMN tbl_member.mb_joindate IS '회원 가입일자'
/

COMMENT ON COLUMN tbl_member.mb_type IS '회원 유형'
/

COMMENT ON COLUMN tbl_member.mb_level IS '회원 등급'
/


-- tbl_chal_item Table Create SQL
CREATE TABLE tbl_chal_item
(
    chal_item_seq     NUMBER(12, 0)    NOT NULL, 
    chal_item_name    VARCHAR2(20)     NOT NULL, 
     PRIMARY KEY (chal_item_seq)
)
/

CREATE SEQUENCE tbl_chal_item_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_chal_item_AI_TRG
BEFORE INSERT ON tbl_chal_item 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_chal_item_SEQ.NEXTVAL
    INTO :NEW.chal_item_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_chal_item_AI_TRG; /

--DROP SEQUENCE tbl_chal_item_SEQ; /

COMMENT ON TABLE tbl_chal_item IS '챌린지 항목'
/

COMMENT ON COLUMN tbl_chal_item.chal_item_seq IS '챌린지 항목 구분'
/

COMMENT ON COLUMN tbl_chal_item.chal_item_name IS '챌린지 항목 이름'
/


-- tbl_level_community Table Create SQL
CREATE TABLE tbl_level_community
(
    lv_seq        NUMBER(12, 0)     NOT NULL, 
    lv_title      VARCHAR2(300)     NOT NULL, 
    lv_content    VARCHAR2(4000)    NOT NULL, 
    lv_file       VARCHAR2(300)     NOT NULL, 
    lv_date       DATE              NOT NULL, 
    mb_id         VARCHAR2(20)      NOT NULL, 
    lv_cnt        NUMBER(12, 0)     NOT NULL, 
     PRIMARY KEY (lv_seq)
)
/

CREATE SEQUENCE tbl_level_community_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_level_community_AI_TRG
BEFORE INSERT ON tbl_level_community 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_level_community_SEQ.NEXTVAL
    INTO :NEW.lv_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_level_community_AI_TRG; /

--DROP SEQUENCE tbl_level_community_SEQ; /

COMMENT ON TABLE tbl_level_community IS '레벨 게시판'
/

COMMENT ON COLUMN tbl_level_community.lv_seq IS '글 번호'
/

COMMENT ON COLUMN tbl_level_community.lv_title IS '글 제목'
/

COMMENT ON COLUMN tbl_level_community.lv_content IS '글 내용'
/

COMMENT ON COLUMN tbl_level_community.lv_file IS '글 첨부파일'
/

COMMENT ON COLUMN tbl_level_community.lv_date IS '글 작성일자'
/

COMMENT ON COLUMN tbl_level_community.mb_id IS '글 작성자'
/

COMMENT ON COLUMN tbl_level_community.lv_cnt IS '글 조회수'
/

ALTER TABLE tbl_level_community
    ADD CONSTRAINT FK_tbl_level_community_mb_id_t FOREIGN KEY (mb_id)
        REFERENCES tbl_member (mb_id) 
/


-- tbl_community Table Create SQL
CREATE TABLE tbl_community
(
    comm_seq        NUMBER(12, 0)     NOT NULL, 
    comm_title      VARCHAR2(300)     NOT NULL, 
    comm_content    VARCHAR2(4000)    NOT NULL, 
    comm_date       DATE              NOT NULL, 
    mb_id           VARCHAR2(20)      NOT NULL, 
    comm_cnt        NUMBER(12, 0)     NOT NULL, 
    comm_file       VARCHAR2(300)     NULL, 
     PRIMARY KEY (comm_seq)
)
/

CREATE SEQUENCE tbl_community_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_community_AI_TRG
BEFORE INSERT ON tbl_community 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_community_SEQ.NEXTVAL
    INTO :NEW.comm_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_community_AI_TRG; /

--DROP SEQUENCE tbl_community_SEQ; /

COMMENT ON TABLE tbl_community IS '전체 게시판'
/

COMMENT ON COLUMN tbl_community.comm_seq IS '글 번호'
/

COMMENT ON COLUMN tbl_community.comm_title IS '글 제목'
/

COMMENT ON COLUMN tbl_community.comm_content IS '글 내용'
/

COMMENT ON COLUMN tbl_community.comm_date IS '글 작성일자'
/

COMMENT ON COLUMN tbl_community.mb_id IS '글 작성자'
/

COMMENT ON COLUMN tbl_community.comm_cnt IS '글 조회수'
/

COMMENT ON COLUMN tbl_community.comm_file IS '글 첨부파일'
/

ALTER TABLE tbl_community
    ADD CONSTRAINT FK_tbl_community_mb_id_tbl_mem FOREIGN KEY (mb_id)
        REFERENCES tbl_member (mb_id) 
/


-- tbl_comm_comment Table Create SQL
CREATE TABLE tbl_comm_comment
(
    comm_cmt_seq        NUMBER(12, 0)     NOT NULL, 
    comm_seq            NUMBER(12, 0)     NOT NULL, 
    comm_cmt_content    VARCHAR2(4000)    NOT NULL, 
    comm_cmt_date       DATE              NOT NULL, 
    mb_id               VARCHAR2(20)      NOT NULL, 
     PRIMARY KEY (comm_cmt_seq)
)
/

CREATE SEQUENCE tbl_comm_comment_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_comm_comment_AI_TRG
BEFORE INSERT ON tbl_comm_comment 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_comm_comment_SEQ.NEXTVAL
    INTO :NEW.comm_cmt_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_comm_comment_AI_TRG; /

--DROP SEQUENCE tbl_comm_comment_SEQ; /

COMMENT ON TABLE tbl_comm_comment IS '전체 게시판 댓글'
/

COMMENT ON COLUMN tbl_comm_comment.comm_cmt_seq IS '댓글 순번'
/

COMMENT ON COLUMN tbl_comm_comment.comm_seq IS '글 번호'
/

COMMENT ON COLUMN tbl_comm_comment.comm_cmt_content IS '댓글 내용'
/

COMMENT ON COLUMN tbl_comm_comment.comm_cmt_date IS '댓글 작성일자'
/

COMMENT ON COLUMN tbl_comm_comment.mb_id IS '댓글 작성자'
/

ALTER TABLE tbl_comm_comment
    ADD CONSTRAINT FK_tbl_comm_comment_comm_seq_t FOREIGN KEY (comm_seq)
        REFERENCES tbl_community (comm_seq) 
/

ALTER TABLE tbl_comm_comment
    ADD CONSTRAINT FK_tbl_comm_comment_mb_id_tbl_ FOREIGN KEY (mb_id)
        REFERENCES tbl_member (mb_id) 
/


-- tbl_lv_comment Table Create SQL
CREATE TABLE tbl_lv_comment
(
    lv_cmt_seq        NUMBER(12, 0)     NOT NULL, 
    lv_seq            NUMBER(12, 0)     NOT NULL, 
    lv_cmt_content    VARCHAR2(4000)    NOT NULL, 
    lv_cmt_date       DATE              NOT NULL, 
    mb_id             VARCHAR2(20)      NOT NULL, 
     PRIMARY KEY (lv_cmt_seq)
)
/

CREATE SEQUENCE tbl_lv_comment_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_lv_comment_AI_TRG
BEFORE INSERT ON tbl_lv_comment 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_lv_comment_SEQ.NEXTVAL
    INTO :NEW.lv_cmt_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_lv_comment_AI_TRG; /

--DROP SEQUENCE tbl_lv_comment_SEQ; /

COMMENT ON TABLE tbl_lv_comment IS '레벨 게시판 댓글'
/

COMMENT ON COLUMN tbl_lv_comment.lv_cmt_seq IS '댓글 순번'
/

COMMENT ON COLUMN tbl_lv_comment.lv_seq IS '글 번호'
/

COMMENT ON COLUMN tbl_lv_comment.lv_cmt_content IS '댓글 내용'
/

COMMENT ON COLUMN tbl_lv_comment.lv_cmt_date IS '댓글 작성일자'
/

COMMENT ON COLUMN tbl_lv_comment.mb_id IS '댓글 작성자'
/

ALTER TABLE tbl_lv_comment
    ADD CONSTRAINT FK_tbl_lv_comment_lv_seq_tbl_l FOREIGN KEY (lv_seq)
        REFERENCES tbl_level_community (lv_seq) 
/

ALTER TABLE tbl_lv_comment
    ADD CONSTRAINT FK_tbl_lv_comment_mb_id_tbl_me FOREIGN KEY (mb_id)
        REFERENCES tbl_member (mb_id) 
/


-- tbl_member_challenge Table Create SQL
CREATE TABLE tbl_member_challenge
(
    mc_seq           NUMBER(12, 0)    NOT NULL, 
    mb_id            VARCHAR2(20)     NOT NULL, 
    chal_item_seq    NUMBER(12, 0)    NOT NULL, 
    pay_money        NUMBER(12, 0)    NOT NULL, 
    pay_date         DATE             NOT NULL, 
     PRIMARY KEY (mc_seq)
)
/

CREATE SEQUENCE tbl_member_challenge_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_member_challenge_AI_TRG
BEFORE INSERT ON tbl_member_challenge 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_member_challenge_SEQ.NEXTVAL
    INTO :NEW.mc_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_member_challenge_AI_TRG; /

--DROP SEQUENCE tbl_member_challenge_SEQ; /

COMMENT ON TABLE tbl_member_challenge IS '회원 챌린지 달성 포인트'
/

COMMENT ON COLUMN tbl_member_challenge.mc_seq IS '회원 첼린지 순번'
/

COMMENT ON COLUMN tbl_member_challenge.mb_id IS '회원 아이디'
/

COMMENT ON COLUMN tbl_member_challenge.chal_item_seq IS '챌린지 항목 구분'
/

COMMENT ON COLUMN tbl_member_challenge.pay_money IS '회원 지출액'
/

COMMENT ON COLUMN tbl_member_challenge.pay_date IS '지출 날짜'
/

ALTER TABLE tbl_member_challenge
    ADD CONSTRAINT FK_tbl_member_challenge_mb_id_ FOREIGN KEY (mb_id)
        REFERENCES tbl_member (mb_id) 
/

ALTER TABLE tbl_member_challenge
    ADD CONSTRAINT FK_tbl_member_challenge_chal_i FOREIGN KEY (chal_item_seq)
        REFERENCES tbl_chal_item (chal_item_seq) 
/













