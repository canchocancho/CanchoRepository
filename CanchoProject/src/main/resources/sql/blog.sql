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

CREATE SEQUENCE blog_post_SEQ
START WITH 1
INCREMENT BY 1;