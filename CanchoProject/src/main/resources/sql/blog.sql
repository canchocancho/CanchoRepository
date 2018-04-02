-- blog_user table
CREATE TABLE blog_user
(
    user_id          VARCHAR2(45)     primary key, 
    user_name        VARCHAR2(45)     NOT NULL, 
    user_email       VARCHAR2(100)    NOT NULL unique, 
    user_password    VARCHAR2(100)    NOT NULL,
    user_verify		 VARCHAR2(50)	  default 'N'
);

-- blog_post table
CREATE TABLE blog_post
(
    post_num            INT              NOT NULL, 
    post_title          VARCHAR2(144)    NOT NULL, 
    post_title_clean    VARCHAR2(10)     NULL, 
    post_file           VARCHAR2(300)    NOT NULL, 
    user_id             VARCHAR2(45)     NOT NULL, 
    post_date           DATE             default SYSDATE, 
    CONSTRAINT BLOG_POST_PK PRIMARY KEY (post_num)
);

-- blog_post sequence
CREATE SEQUENCE blog_post_seq
START WITH 1
INCREMENT BY 1;


--test test test


-- ---------------------------------------------------아래는 아직 안 만든 테이블


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

CREATE SEQUENCE blog_comment_SEQ
START WITH 1
INCREMENT BY 1;

-- tag table
CREATE TABLE blog_tag
(
    post_num    INT             NOT NULL, 
    tag_name    VARCHAR(100)    NULL  
    ,CONSTRAINT FK_blog_tag_post_num_blog_post FOREIGN KEY (post_num)
    REFERENCES blog_post (post_num)
)

-- blog_block table
CREATE TABLE blog_block
(
    user_id       VARCHAR2(45)    NOT NULL, 
    blocked_id    VARCHAR2(45)    NOT NULL, 
    CONSTRAINT BLOG_BLOCK_PK PRIMARY KEY (user_id)
    ,CONSTRAINT FK_blog_block_user_id_blog_use FOREIGN KEY (user_id)
    REFERENCES blog_user (user_id)
)

-- blog_friend table
CREATE TABLE blog_friend
(
    user_id      VARCHAR2(45)    NOT NULL, 
    friend_id    VARCHAR2(45)    NOT NULL,
    CONSTRAINT FK_blog_friend_user_id_blog_us FOREIGN KEY (user_id)
    REFERENCES blog_user (user_id)
)