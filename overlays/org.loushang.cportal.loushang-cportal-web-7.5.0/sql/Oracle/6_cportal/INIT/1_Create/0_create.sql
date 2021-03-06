--页面 
CREATE TABLE CP_PAGE
(
  ID VARCHAR2 (32) NOT NULL,
  NAME VARCHAR2 (100),
  DESCRIPTION VARCHAR2 (100),
  IS_RELEASE CHAR (1) NOT NULL,
  CONTENT CLOB,
  CREATE_TIME CHAR (17) NOT NULL,
  UPDATE_TIME CHAR (17) NOT NULL,
  ICON VARCHAR2 (255)
);
ALTER TABLE CP_PAGE
    ADD CONSTRAINT CP_PAGE
PRIMARY KEY (ID);

--页面微件
CREATE TABLE CP_PAGE_WIDGET
(
  ID VARCHAR2 (32) NOT NULL,
  PAGE_ID VARCHAR2 (32) NOT NULL,
  WIDGET_ID VARCHAR2 (1024) NOT NULL
);
ALTER TABLE CP_PAGE_WIDGET
    ADD CONSTRAINT CP_PW
PRIMARY KEY (ID);

--微件类别
CREATE TABLE CP_WIDGET_TYPE
(
  ID VARCHAR2 (32) NOT NULL,
  NAME VARCHAR2 (100),
  DESCRIPTION VARCHAR2 (100),
  DISPLAY_ORDER NUMBER (18,0),
  PARENT_ID VARCHAR2 (32) NOT NULL
);
ALTER TABLE CP_WIDGET_TYPE
    ADD CONSTRAINT CP_WT
PRIMARY KEY (ID);

--微件
CREATE TABLE CP_WIDGET
(
  ID VARCHAR2 (32) NOT NULL,
  NAME VARCHAR2 (100),
  DESCRIPTION VARCHAR2 (100),
  CONTENT VARCHAR2 (255) NOT NULL,
  AUTHOR VARCHAR2(32) NOT NULL,
  ICON  VARCHAR2 (255) NOT NULL,
  HEIGHT NUMBER (18,0),
  LOAD_TYPE CHAR(1),
  DISPLAY_ORDER NUMBER (18,0),
  TYPE_ID VARCHAR2 (32) NOT NULL,
  CREATE_TIME CHAR (17) NOT NULL,
  UPDATE_TIME CHAR (17) NOT NULL,
  EXPAND_CONTENT VARCHAR2 (255)
);
ALTER TABLE CP_WIDGET
    ADD CONSTRAINT CP_WIDGET
PRIMARY KEY (ID);
--用户页面微件
CREATE TABLE CP_PAGE_WIDGET_USER
(
  ID VARCHAR2 (32) NOT NULL,
  PAGE_ID VARCHAR2 (32) NOT NULL,
  WIDGET_ID VARCHAR2 (1024) NOT NULL,
  USER_ID VARCHAR2 (32) NOT NULL
);
ALTER TABLE CP_PAGE_WIDGET_USER
    ADD CONSTRAINT CP_PWU
PRIMARY KEY (ID);