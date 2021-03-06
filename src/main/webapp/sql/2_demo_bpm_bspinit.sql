INSERT INTO PUB_ORGAN (ORGAN_ID,ORGAN_CODE, ORGAN_NAME, SHORT_NAME, ORGAN_TYPE, IN_USE)VALUES ('O6666600000000000002','666601','BPM参与者','','1','1');
INSERT INTO PUB_ORGAN (ORGAN_ID,ORGAN_CODE, ORGAN_NAME, SHORT_NAME, ORGAN_TYPE, IN_USE)VALUES ('O6666600000000000003','66660101','研发部','','2','1');
INSERT INTO PUB_ORGAN (ORGAN_ID,ORGAN_CODE, ORGAN_NAME, SHORT_NAME, ORGAN_TYPE, IN_USE)VALUES ('O6666600000000000004','66660102','财务部','','2','1');
INSERT INTO PUB_ORGAN (ORGAN_ID,ORGAN_CODE, ORGAN_NAME, SHORT_NAME, ORGAN_TYPE, IN_USE)VALUES ('O6666600000000000005','6666010101','张峰','','8','1');
INSERT INTO PUB_ORGAN (ORGAN_ID,ORGAN_CODE, ORGAN_NAME, SHORT_NAME, ORGAN_TYPE, IN_USE)VALUES ('O6666600000000000006','6666010102','李坤','','8','1');
INSERT INTO PUB_ORGAN (ORGAN_ID,ORGAN_CODE, ORGAN_NAME, SHORT_NAME, ORGAN_TYPE, IN_USE)VALUES ('O6666600000000000007','6666010201','孙岩','','8','1');

INSERT INTO PUB_STRU(STRU_ID,ORGAN_ID,STRU_TYPE,PARENT_ID,STRU_LEVEL,STRU_PATH,STRU_ORDER,IS_LEAF,IN_USE)VALUES('S6666600000000000002','O6666600000000000002','00','1',2,'rootId#1#S6666600000000000002',600,'0','1');
INSERT INTO PUB_STRU(STRU_ID,ORGAN_ID,STRU_TYPE,PARENT_ID,STRU_LEVEL,STRU_PATH,STRU_ORDER,IS_LEAF,IN_USE)VALUES('S6666600000000000003','O6666600000000000003','00','O6666600000000000002',3,'rootId#1#S6666600000000000002#S6666600000000000003',200,'0','1');
INSERT INTO PUB_STRU(STRU_ID,ORGAN_ID,STRU_TYPE,PARENT_ID,STRU_LEVEL,STRU_PATH,STRU_ORDER,IS_LEAF,IN_USE)VALUES('S6666600000000000004','O6666600000000000004','00','O6666600000000000002',3,'rootId#1#S6666600000000000002#S6666600000000000004',400,'0','1');
INSERT INTO PUB_STRU(STRU_ID,ORGAN_ID,STRU_TYPE,PARENT_ID,STRU_LEVEL,STRU_PATH,STRU_ORDER,IS_LEAF,IN_USE)VALUES('S6666600000000000005','O6666600000000000005','00','O6666600000000000003',4,'rootId#1#S6666600000000000002#S6666600000000000003#S6666600000000000005',200,'1','1');
INSERT INTO PUB_STRU(STRU_ID,ORGAN_ID,STRU_TYPE,PARENT_ID,STRU_LEVEL,STRU_PATH,STRU_ORDER,IS_LEAF,IN_USE)VALUES('S6666600000000000006','O6666600000000000006','00','O6666600000000000003',4,'rootId#1#S6666600000000000002#S6666600000000000003#S6666600000000000006',400,'1','1');
INSERT INTO PUB_STRU(STRU_ID,ORGAN_ID,STRU_TYPE,PARENT_ID,STRU_LEVEL,STRU_PATH,STRU_ORDER,IS_LEAF,IN_USE)VALUES('S6666600000000000007','O6666600000000000007','00','O6666600000000000004',4,'rootId#1#S6666600000000000002#S6666600000000000004#S6666600000000000007',200,'1','1');

INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000002','00','O6666600000000000002','O6666600000000000002','00','S6666600000000000002');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000003','01','O6666600000000000002','O6666600000000000002','00','S6666600000000000002');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000004','00','O6666600000000000003','O6666600000000000003','00','S6666600000000000003');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000005','01','O6666600000000000003','O6666600000000000002','00','S6666600000000000003');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000006','00','O6666600000000000004','O6666600000000000004','00','S6666600000000000004');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000007','01','O6666600000000000004','O6666600000000000002','00','S6666600000000000004');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000008','00','O6666600000000000005','O6666600000000000003','00','S6666600000000000005');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000009','01','O6666600000000000005','O6666600000000000002','00','S6666600000000000005');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000010','00','O6666600000000000006','O6666600000000000003','00','S6666600000000000006');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000011','01','O6666600000000000006','O6666600000000000002','00','S6666600000000000006');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000012','00','O6666600000000000007','O6666600000000000004','00','S6666600000000000007');
INSERT INTO PUB_STRU_EXT(ID,TYPE,SRC_ID, TARGET_ID,STRU_TYPE,STRU_ID)VALUES('66666000000000000013','01','O6666600000000000007','O6666600000000000002','00','S6666600000000000007');

INSERT INTO  PUB_USERS(USER_ID, USER_TYPE_CODE, USER_NAME, PASSWORD, ACCOUNT_STATUS, IS_SYS, CREATE_TIME, LOCK_TIME, EXPIRED_TIME, PWD_UPT_TIME, PWD_TIME, ID_NUM ) VALUES ( 'LIKUN', '00', '李坤', '2a408cc06b0be386d1ca9289496292a5', '11', '0', '20140311 13:28:28', null, null, null, null, null );
INSERT INTO  PUB_USERS(USER_ID, USER_TYPE_CODE, USER_NAME, PASSWORD, ACCOUNT_STATUS, IS_SYS, CREATE_TIME, LOCK_TIME, EXPIRED_TIME, PWD_UPT_TIME, PWD_TIME, ID_NUM ) VALUES ( 'SUNYAN', '00', '孙岩', '5b812e1323416dbd0f80e1bb847ee7f0', '11', '0', '20140311 13:28:57', null, null, '20140311 13:29:04', null, null );
INSERT INTO  PUB_USERS(USER_ID, USER_TYPE_CODE, USER_NAME, PASSWORD, ACCOUNT_STATUS, IS_SYS, CREATE_TIME, LOCK_TIME, EXPIRED_TIME, PWD_UPT_TIME, PWD_TIME, ID_NUM ) VALUES ( 'ZHANGFENG', '00', '张峰', 'cd24ea7ab9a2f18f170272b975c42a94', '11', '0', '20140311 13:27:36', null, null, '20140311 13:27:51', null, null );

INSERT INTO  PUB_USER_EMPLOYEE(USER_ID, CORPORATION_ID, DEPARTMENT_ID, EMPLOYEE_ID ) VALUES ( 'LIKUN', 'O6666600000000000002', 'O6666600000000000003', 'S6666600000000000006' );
INSERT INTO  PUB_USER_EMPLOYEE(USER_ID, CORPORATION_ID, DEPARTMENT_ID, EMPLOYEE_ID ) VALUES ( 'SUNYAN', 'O6666600000000000002', 'O6666600000000000004', 'S6666600000000000007' );
INSERT INTO  PUB_USER_EMPLOYEE(USER_ID, CORPORATION_ID, DEPARTMENT_ID, EMPLOYEE_ID ) VALUES ( 'ZHANGFENG', 'O6666600000000000002', 'O6666600000000000003', 'S6666600000000000005' );

INSERT INTO  PUB_USER_POLICY(USER_ID, IS_USE_IP, IP_POLICY_VALUE, MAX_SESSION_NUMBER ) VALUES ( 'LIKUN', '0', '', 1 );
INSERT INTO  PUB_USER_POLICY(USER_ID, IS_USE_IP, IP_POLICY_VALUE, MAX_SESSION_NUMBER ) VALUES ( 'SUNYAN', '0', '', 1 );
INSERT INTO  PUB_USER_POLICY(USER_ID, IS_USE_IP, IP_POLICY_VALUE, MAX_SESSION_NUMBER ) VALUES ( 'ZHANGFENG', '0', '', 1 );

INSERT INTO  PUB_USER_ROLE(RULE_ID, RULE_TYPE, TARGET, ROLE_ID ) VALUES ( '666660000000000000000000000007', '00', 'ZHANGFENG', 'WORKFLOWCOMUSER' );
INSERT INTO  PUB_USER_ROLE(RULE_ID, RULE_TYPE, TARGET, ROLE_ID ) VALUES ( '666660000000000000000000000008', '00', 'SUNYAN', 'WORKFLOWCOMUSER' );
INSERT INTO  PUB_USER_ROLE(RULE_ID, RULE_TYPE, TARGET, ROLE_ID ) VALUES ( '666660000000000000000000000009', '00', 'LIKUN', 'WORKFLOWCOMUSER' );