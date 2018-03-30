-- blod_user table
CREATE TABLE blog_user
(
    user_id          VARCHAR2(45)     NOT NULL, 
    user_name        VARCHAR2(45)     NOT NULL, 
    user_email       VARCHAR2(100)    NOT NULL, 
    user_password    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT BLOG_USER_PK PRIMARY KEY (user_id)
);
/

COMMENT ON TABLE blog_user IS '회원'
/

COMMENT ON COLUMN blog_user.user_id IS '회원 아이디'
/

COMMENT ON COLUMN blog_user.user_name IS '회원 이름'
/

COMMENT ON COLUMN blog_user.user_email IS '회원 이메일'
/

COMMENT ON COLUMN blog_user.user_password IS '웹사이트 주소'
/

CREATE INDEX blog_user_Index_2 ON blog_user (
    user_email ASC
)
/


-- blog_post table
CREATE TABLE blog_post
(
    post_num            INT              NOT NULL, 
    post_title          VARCHAR2(144)    NOT NULL, 
    post_title_clean    VARCHAR2(10)     NULL, 
    post_file           VARCHAR2(300)    NOT NULL, 
    user_id             VARCHAR2(45)     NOT NULL, 
    post_date           DATE             NOT NULL, 
    CONSTRAINT BLOG_POST_PK PRIMARY KEY (post_num)
);
/

CREATE SEQUENCE blog_post_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER blog_post_post_num_AI_TRG
BEFORE INSERT ON blog_post 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT blog_post_SEQ.NEXTVAL
    INTO: NEW.post_num
    FROM DUAL;
END;
/

COMMENT ON TABLE blog_post IS '게시글'
/

COMMENT ON COLUMN blog_post.post_num IS '게시글 아이디'
/

COMMENT ON COLUMN blog_post.post_title IS '게시글 제목'
/

COMMENT ON COLUMN blog_post.post_title_clean IS '수정된 게시글 제목'
/

COMMENT ON COLUMN blog_post.post_file IS '첨부 파일'
/

COMMENT ON COLUMN blog_post.user_id IS '저자 아이디'
/

COMMENT ON COLUMN blog_post.post_date IS '공개 일자'
/

CREATE INDEX blog_post_Index_3 ON blog_post (
    post_title_clean ASC
)
/

CREATE INDEX blog_post_Index_2 ON blog_post (
    user_id ASC
)
/

ALTER TABLE blog_post
    ADD CONSTRAINT FK_blog_post_user_id_blog_user FOREIGN KEY (user_id)
        REFERENCES blog_user (user_id)
/



-- comment table
CREATE TABLE blog_comment
(
    commet_num      INT              NOT NULL, 
    post_num        INT              NOT NULL, 
    comment_text    VARCHAR2(300)    NOT NULL, 
    user_id         VARCHAR2(45)     NOT NULL, 
    comment_date    DATE             NOT NULL, 
    CONSTRAINT BLOG_COMMENT_PK PRIMARY KEY (commet_num)
    ,CONSTRAINT FK_blog_comment_post_num_blog_ FOREIGN KEY (post_num)
    REFERENCES blog_post (post_num)
    ,CONSTRAINT FK_blog_comment_user_id_blog_u FOREIGN KEY (user_id)
    REFERENCES blog_user (user_id)
)
/

CREATE SEQUENCE blog_comment_SEQ
START WITH 1
INCREMENT BY 1;
/
drop sequence blog_comment_seq;


CREATE OR REPLACE TRIGGER blog_comment_commet_num_AI_TRG
BEFORE INSERT ON blog_comment 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT blog_comment_SEQ.NEXTVAL
    INTO: NEW.commet_num
    FROM DUAL;
END;
/

COMMENT ON TABLE blog_comment IS '댓글'
/

COMMENT ON COLUMN blog_comment.commet_num IS '댓글 아이디'
/

COMMENT ON COLUMN blog_comment.post_num IS '게시글 아이디'
/

COMMENT ON COLUMN blog_comment.comment_text IS '댓글 내용'
/

COMMENT ON COLUMN blog_comment.user_id IS '회원 아이디'
/

COMMENT ON COLUMN blog_comment.comment_date IS '등록일'
/

CREATE INDEX blog_comment_Index_2 ON blog_comment (
    post_num ASC
)
/

CREATE INDEX blog_comment_Index_3 ON blog_comment (
    user_id ASC
)
/

ALTER TABLE blog_comment
    ADD CONSTRAINT FK_blog_comment_post_num_blog_ FOREIGN KEY (post_num)
        REFERENCES blog_post (post_num)
/

ALTER TABLE blog_comment
    ADD CONSTRAINT FK_blog_comment_user_id_blog_u FOREIGN KEY (user_id)
        REFERENCES blog_user (user_id)
/




-- tag table
CREATE TABLE blog_tag
(
    post_num    INT             NOT NULL, 
    tag_name    VARCHAR(100)    NULL  
    ,CONSTRAINT FK_blog_tag_post_num_blog_post FOREIGN KEY (post_num)
    REFERENCES blog_post (post_num)
)
/

COMMENT ON TABLE blog_tag IS '테그'
/

COMMENT ON COLUMN blog_tag.post_num IS '게시글 아이디'
/

COMMENT ON COLUMN blog_tag.tag_name IS '테그 내용'
/

CREATE INDEX blog_tag_Index_2 ON blog_tag (
    post_num ASC
)
/



-- blog_block table
CREATE TABLE blog_block
(
    user_id       VARCHAR2(45)    NOT NULL, 
    blocked_id    VARCHAR2(45)    NOT NULL, 
    CONSTRAINT BLOG_BLOCK_PK PRIMARY KEY (user_id)
    ,CONSTRAINT FK_blog_block_user_id_blog_use FOREIGN KEY (user_id)
    REFERENCES blog_user (user_id)
)
/



-- blog_freind table
CREATE TABLE blog_friend
(
    user_id      VARCHAR2(45)    NOT NULL, 
    friend_id    VARCHAR2(45)    NOT NULL,
    CONSTRAINT FK_blog_friend_user_id_blog_us FOREIGN KEY (user_id)
    REFERENCES blog_user (user_id)
)
/