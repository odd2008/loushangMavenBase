---------------------------流程-----------------------
--流程实例
CREATE TABLE WF_PROCESS
(
  PROCESS_ID VARCHAR2 (32) NOT NULL ,
  DEFINITION_ID VARCHAR2 (32) NOT NULL ,
  PROCESS_NAME VARCHAR2 (100) NOT NULL ,
  PROC_DEF_UNIQUE_ID VARCHAR2 (32) NOT NULL ,
  PROCESS_TYPE VARCHAR2 (32),
  ACTIVITY_REQ_ID VARCHAR2 (32) ,
  ACTIVITY_REQ_PROCESS_ID VARCHAR2 (32) ,
  RESOURCE_REQ_ID VARCHAR2 (32) ,
  RESOURCE_REQ_NAME VARCHAR2 (100) ,
  REQ_TYPE CHAR (1) NOT NULL ,
  CURRENT_STATE VARCHAR2 (32) NOT NULL ,
  CREATE_TIME CHAR (17) NOT NULL ,
  CURRENT_STATE_TIME CHAR (17) NOT NULL ,
  SOURCE_REFERENCE_ID VARCHAR2 (255) 
);
ALTER TABLE WF_PROCESS
    ADD CONSTRAINT WFPROCESS_PK 
    PRIMARY KEY (PROCESS_ID);

--流程限时
CREATE TABLE WF_PROCESS_LIMIT
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            LIMIT_TIME CHAR (17) NOT NULL ,
            MILLIS_LIMIT_TIME NUMBER (18,0) NOT NULL 
);
ALTER TABLE WF_PROCESS_LIMIT
    ADD CONSTRAINT PROCESSLIMIT_PK 
    PRIMARY KEY (ID);

--流程预警
CREATE TABLE WF_PROCESS_WARN
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            WARN_TIME CHAR (17) NOT NULL ,
            MILLIS_WARN_TIME NUMBER (18,0) NOT NULL 
);
 ALTER TABLE WF_PROCESS_WARN
    ADD CONSTRAINT PROCESSWARN_PK 
    PRIMARY KEY (ID);
    
--流程监控者
CREATE TABLE WF_PROCESS_MONITOR
(
    ID VARCHAR2 (32) NOT NULL ,
    PROCESS_ID VARCHAR2 (32) NOT NULL ,
    ORGAN_ID VARCHAR2 (32) NOT NULL ,
    ORGAN_NAME VARCHAR2 (100)
);
 ALTER TABLE WF_PROCESS_MONITOR
    ADD CONSTRAINT WFPROCMONITOR_PK 
    PRIMARY KEY (ID);

--流程挂起事件记录
CREATE TABLE WF_PROCESS_SUSPEND_EVENT
(
	EVENT_ID VARCHAR2(32) NOT NULL,
	PROCESS_ID VARCHAR2(32) NOT NULL,
	SUSPEND_TIME CHAR(17) NOT NULL
);
ALTER TABLE WF_PROCESS_SUSPEND_EVENT
	ADD CONSTRAINT PROC_SD_EVT_PK
    PRIMARY KEY(EVENT_ID);

--流程恢复事件记录
CREATE TABLE WF_PROCESS_RESUME_EVENT
(
	EVENT_ID VARCHAR2(32) NOT NULL,
	SUSPEND_EVENT_ID VARCHAR2(32) NOT NULL,
	PROCESS_ID VARCHAR2(32) NOT NULL,
	RESUME_TIME CHAR(17) NOT NULL
);
ALTER  TABLE WF_PROCESS_RESUME_EVENT
	ADD CONSTRAINT PROC_RM_EVT_PK
    PRIMARY KEY(EVENT_ID);

--流程合并
CREATE TABLE WF_PROCESS_MERGE
(
            ID VARCHAR2 (32) NOT NULL ,
            MERGED_PROCESS_ID VARCHAR2 (32) NOT NULL ,
            MERGED_ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
            MERGED_ASSIGNMENT_ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
            ASSIGNMENT_ID VARCHAR2 (32) NOT NULL 
);
ALTER TABLE WF_PROCESS_MERGE
    ADD CONSTRAINT WFPROCESSMERGE_PK 
    PRIMARY KEY (ID);
    
---------------------------环节组---------------------
--环节组实例表
CREATE TABLE WF_ACT_SET(
	ID VARCHAR (32) NOT NULL , 
	PROCESS_ID VARCHAR (32) NOT NULL , 
	ACT_SET_DEF_UNIQUE_ID VARCHAR (32) NOT NULL , 
	ACT_SET_DEF_ID VARCHAR (32) NOT NULL , 
	ACT_SET_DEF_NAME VARCHAR (100) NOT NULL , 
	CURRENT_STATE VARCHAR (32) NOT NULL , 
	CREATE_TIME CHAR (17) , 
	CURRENT_STATE_TIME CHAR (17) 
);
ALTER TABLE WF_ACT_SET
    ADD CONSTRAINT ACTSET_PK 
    PRIMARY KEY (ID);

--环节关联环节组实例表
CREATE TABLE WF_ACT_SET_REF(
	ID VARCHAR (32) NOT NULL ,
	PROCESS_ID VARCHAR (32) NOT NULL , 
	ACT_SET_ID VARCHAR (32) NOT NULL , 
	ACTIVITY_ID VARCHAR (32) NOT NULL ,
	ACT_SET_DEF_UNIQUE_ID VARCHAR (32) NOT NULL , 
	ACT_SET_DEF_ID VARCHAR (32) NOT NULL , 
	ACT_SET_DEF_NAME VARCHAR (32) NOT NULL
);
ALTER TABLE WF_ACT_SET_REF
    ADD CONSTRAINT ACTSETREF_PK 
    PRIMARY KEY (ID);   
    
--环节组限时
CREATE TABLE WF_ACT_SET_LIMIT
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            ACT_SET_DEF_UNIQUE_ID VARCHAR (32) NOT NULL ,
            ACT_SET_ID VARCHAR2 (32) NOT NULL ,
            LIMIT_TIME CHAR (17) NOT NULL ,
            MILLIS_LIMIT_TIME NUMBER (18,0) NOT NULL 
);
ALTER TABLE WF_ACT_SET_LIMIT
    ADD CONSTRAINT ACTSETLIMIT_PK 
    PRIMARY KEY (ID);

--环节组预警
CREATE TABLE WF_ACT_SET_WARN
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            ACT_SET_DEF_UNIQUE_ID VARCHAR (32) NOT NULL ,
            ACT_SET_ID VARCHAR2 (32) NOT NULL ,
            WARN_TIME CHAR (17) NOT NULL ,
            MILLIS_WARN_TIME NUMBER (18,0) NOT NULL 
);
ALTER TABLE WF_ACT_SET_WARN
    ADD CONSTRAINT ACTSETWARN_PK 
    PRIMARY KEY (ID);
    
---------------------------环节-----------------------
--环节实例
CREATE TABLE WF_ACTIVITY
(
   ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
   DEFINITION_ID VARCHAR2 (32) NOT NULL ,
   ACTIVITY_NAME VARCHAR2 (100) NOT NULL ,
   ACT_DEF_UNIQUE_ID VARCHAR2 (32) NOT NULL ,
   PROCESS_ID VARCHAR2 (32) NOT NULL ,
   CURRENT_STATE VARCHAR2 (32) NOT NULL ,
   CREATE_TIME CHAR (17) NOT NULL ,
   CURRENT_STATE_TIME CHAR (17) NOT NULL 
);
 ALTER TABLE WF_ACTIVITY
    ADD CONSTRAINT WFACTIVITY_PK 
    PRIMARY KEY (ACTIVITY_ID);

 --环节限时
CREATE TABLE WF_ACTIVITY_LIMIT
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
            LIMIT_TIME CHAR (17) NOT NULL ,
            MILLIS_LIMIT_TIME NUMBER (18,0) NOT NULL 
);
ALTER TABLE WF_ACTIVITY_LIMIT
    ADD CONSTRAINT ACTIVITYLIMIT_PK 
    PRIMARY KEY (ID);

--环节预警
CREATE TABLE WF_ACTIVITY_WARN
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
            WARN_TIME CHAR (17) NOT NULL ,
            MILLIS_WARN_TIME NUMBER (18,0) NOT NULL 
);
 ALTER TABLE WF_ACTIVITY_WARN
    ADD CONSTRAINT ACTIVITYWARN_PK 
    PRIMARY KEY (ID);
    
--环节挂起事件记录
CREATE TABLE WF_ACTIVITY_SUSPEND_EVENT
(
	EVENT_ID VARCHAR2(32) NOT NULL,
	ACTIVITY_ID VARCHAR2(32) NOT NULL,
	SUSPEND_TIME CHAR(17) NOT NULL
);
ALTER TABLE WF_ACTIVITY_SUSPEND_EVENT
	ADD CONSTRAINT ACT_SD_EVT_PK
    PRIMARY KEY(EVENT_ID);
    
--环节恢复事件记录
CREATE TABLE WF_ACTIVITY_RESUME_EVENT
(
	EVENT_ID VARCHAR2(32) NOT NULL,
	SUSPEND_EVENT_ID VARCHAR2(32) NOT NULL,
	ACTIVITY_ID VARCHAR2(32) NOT NULL,
	RESUME_TIME CHAR(17) NOT NULL
);
ALTER  TABLE WF_ACTIVITY_RESUME_EVENT
	ADD CONSTRAINT ACT_RM_EVT_PK
    PRIMARY KEY(EVENT_ID);

---------------------------委派-----------------------
--委派
CREATE TABLE WF_ASSIGNMENT
(
  ASSIGNMENT_ID VARCHAR2 (32) NOT NULL ,
  ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
  ORGAN_ID VARCHAR2 (32) NOT NULL ,
  ORGAN_NAME VARCHAR2 (100) ,
  STATUS_ID VARCHAR2 (32) NOT NULL ,
  ACTUAL_USER_ID VARCHAR2 (32) ,
  ACTUAL_ORGAN_ID VARCHAR2 (32) ,
  ACTUAL_ORGAN_NAME VARCHAR2 (100) ,
  CREATE_TIME CHAR (17) NOT NULL ,
  END_TIME CHAR (17)
);
 ALTER TABLE WF_ASSIGNMENT
    ADD CONSTRAINT WFASSIGNMENT_PK 
    PRIMARY KEY (ASSIGNMENT_ID);
 
--出差代理委派实例
CREATE TABLE WF_TRIP_PROXY_ASSIGNMENT  
( 
    ID                 	VARCHAR2(32) NOT NULL,
    PROCESS_ID VARCHAR (32) ,
    ACTIVITY_ID VARCHAR (32) ,
    ASSIGNMENT_ID        	VARCHAR2(32) NOT NULL,
    ORIGINAL_ORGAN_ID      VARCHAR2(32) NOT NULL,
    ORIGINAL_ORGAN_NAME  	VARCHAR2(100) NOT NULL,
    PROXY_ORGAN_ID	 VARCHAR2(32) NOT NULL,
    PROXY_ORGAN_NAME   	VARCHAR2(100) NOT NULL
);
ALTER TABLE WF_TRIP_PROXY_ASSIGNMENT
    ADD CONSTRAINT TRIPPROXYASSPK 
    PRIMARY KEY (ID);
    
--后续委派，用于顺序会签
CREATE TABLE WF_ASSIGN_NEXT
(
    ID VARCHAR2 (32) NOT NULL,
    ACTIVITY_ID VARCHAR2 (32) NOT NULL,
    NEXT_PARTIES VARCHAR2 (512) NOT NULL
);
ALTER TABLE WF_ASSIGN_NEXT 
   ADD CONSTRAINT WF_ASSIGN_NEXT_PK 
   PRIMARY KEY(ID);
   
--任务分派
CREATE TABLE WF_ASSIGN_PRE
(
  ID VARCHAR2 (32) NOT NULL ,
  PROCESS_ID VARCHAR2 (32) NOT NULL ,
  ACT_DEF_UNIQUE_ID VARCHAR2 (32) NOT NULL ,
  ORGAN_ID VARCHAR2 (32) NOT NULL ,
  ORGAN_NAME VARCHAR2 (100) NOT NULL 
);
--主键
ALTER TABLE WF_ASSIGN_PRE
    ADD CONSTRAINT ASSIGNPRE_PK 
    PRIMARY KEY (ID);
--外键    
ALTER TABLE WF_ASSIGN_PRE
    ADD CONSTRAINT ASSIGNPRE_FK1 FOREIGN KEY (PROCESS_ID)
    REFERENCES WF_PROCESS (PROCESS_ID);
ALTER TABLE WF_ASSIGN_PRE
    ADD CONSTRAINT ASSIGNPRE_FK2 FOREIGN KEY (ACT_DEF_UNIQUE_ID)
    REFERENCES WF_ACTIVITY_DEF (ID);
---------------------------迁移-----------------------
--环节迁移
CREATE TABLE WF_TRANSITION
(
    ID VARCHAR2 (32) NOT NULL ,
    ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
    PRE_ACTIVITY_ID VARCHAR2 (32) ,
    CREATE_TIME CHAR (17) NOT NULL ,
    PRE_ACTIVITY_NAME VARCHAR2 (100) ,
    ACTIVITY_NAME VARCHAR2 (100) 
);
 ALTER TABLE WF_TRANSITION
    ADD CONSTRAINT WFTRANSITION_PK 
    PRIMARY KEY (ID);
    
--环节退回迁移
CREATE TABLE WF_TRANSITION_BACK
(
    ID VARCHAR2 (32) NOT NULL,
    ACTIVITY_ID VARCHAR2 (32) NOT NULL,
    PRE_ACTIVITY_ID VARCHAR2 (32),
    CREATE_TIME CHAR (17) NOT NULL,
    PRE_ACTIVITY_NAME VARCHAR2 (100),
    ACTIVITY_NAME VARCHAR2 (100),
    ACTIVITY_REF_ID VARCHAR (32)
);
ALTER TABLE WF_TRANSITION_BACK
    ADD CONSTRAINT TRANS_BACK_PK 
    PRIMARY KEY (ID);

--发散环节实例和汇聚环节定义的关联关系
CREATE TABLE WF_SPLIT_INST_JOIN
(
	ID VARCHAR2 (32) NOT NULL ,
	SPLIT_INST_SET_ID VARCHAR2 (32) NOT NULL ,
	PROCESS_ID VARCHAR2 (32) NOT NULL ,
	ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
	ACT_DEF_UNIQUE_ID VARCHAR2 (32) NOT NULL
);

---------------------------相关数据-------------------
--相关数据实例
CREATE TABLE WF_DATA_FIELD 
(
   ID VARCHAR2(32) NOT NULL, 
   VALUE VARCHAR2(255) NOT NULL, 
   PROCESS_ID VARCHAR2(32) NOT NULL, 
   DATA_FIELD_DEF_UNIQUE_ID VARCHAR2(32) NOT NULL,
   DATA_FIELD_DEF_ID 	VARCHAR2(32) NOT NULL
);
ALTER TABLE WF_DATA_FIELD 
   ADD CONSTRAINT WF_DATA_FIELD_PK 
   PRIMARY KEY(ID);

---------------------------归档-----------------------
--流程实例归档
CREATE TABLE WF_PROCESS_END
(
  PROCESS_ID VARCHAR2 (32) NOT NULL ,
  DEFINITION_ID VARCHAR2 (32) NOT NULL ,
  PROCESS_NAME VARCHAR2 (100) NOT NULL ,
  PROC_DEF_UNIQUE_ID VARCHAR2 (32) NOT NULL ,
  PROCESS_TYPE VARCHAR2 (32),
  ACTIVITY_REQ_PROCESS_ID VARCHAR2 (32) ,
  ACTIVITY_REQ_ID VARCHAR2 (32) ,
  RESOURCE_REQ_ID VARCHAR2 (32) ,
  RESOURCE_REQ_NAME VARCHAR2 (100) ,
  REQ_TYPE CHAR (1) NOT NULL ,
  CREATE_TIME CHAR (17) NOT NULL ,
  END_TIME CHAR (17) NOT NULL ,
  SOURCE_REFERENCE_ID VARCHAR2 (255),
  MILLIS_CREATE_TIME NUMBER (18,0),
  MILLIS_END_TIME NUMBER (18,0),
  IS_TIMEOUT CHAR (1) DEFAULT '0' NOT NULL
);
 ALTER TABLE WF_PROCESS_END
    ADD CONSTRAINT WFPROCESSEND_PK 
    PRIMARY KEY (PROCESS_ID);
    
--自由流结束信息归档
CREATE TABLE WF_FREEDOM_PROCESS_END
(
  PROCESS_ID VARCHAR (32) NOT NULL ,
  PROC_STATE_XML BLOB NOT NULL
);
 ALTER TABLE WF_FREEDOM_PROCESS_END
    ADD CONSTRAINT FREEDOMPROCEND_PK 
    PRIMARY KEY (PROCESS_ID);

--办结流程实例模型
CREATE TABLE WF_END_PROCESS_INSTANCE_MODEL
(
  PROCESS_ID VARCHAR (32) NOT NULL ,
  MODEL_CONTENT BLOB NOT NULL
);
ALTER TABLE WF_END_PROCESS_INSTANCE_MODEL
    ADD CONSTRAINT ENDPROCMODEL_PK 
    PRIMARY KEY (PROCESS_ID);

--环节组实例归档
CREATE TABLE WF_ACT_SET_END(
	ID VARCHAR (32) NOT NULL , 
	PROCESS_ID VARCHAR (32) NOT NULL , 
	ACT_SET_DEF_UNIQUE_ID VARCHAR (32) NOT NULL , 
	ACT_SET_DEF_ID VARCHAR (32) NOT NULL , 
	ACT_SET_DEF_NAME VARCHAR (100) NOT NULL , 
	CREATE_TIME CHAR (17) , 
	MILLIS_CREATE_TIME DECIMAL (18,0) ,
	END_TIME CHAR (17) , 
	STATE VARCHAR (32) , 
	MILLIS_END_TIME DECIMAL (18,0) ,
	IS_TIMEOUT CHAR (1) DEFAULT '0' NOT NULL 
);
ALTER TABLE WF_ACT_SET_END
    ADD CONSTRAINT ACTSETEND_PK 
    PRIMARY KEY (ID);

--环节关联环节组归档表
CREATE TABLE WF_ACT_SET_REF_END(
      ID VARCHAR (32) NOT NULL ,
	  PROCESS_ID VARCHAR (32) NOT NULL , 
      ACT_SET_ID VARCHAR (32) NOT NULL , 
      ACTIVITY_ID VARCHAR (32) NOT NULL ,
      ACT_SET_DEF_UNIQUE_ID VARCHAR (32) NOT NULL , 
      ACT_SET_DEF_ID VARCHAR (32) NOT NULL , 
      ACT_SET_DEF_NAME VARCHAR (32) NOT NULL
);
ALTER TABLE WF_ACT_SET_REF_END
    ADD CONSTRAINT ACTSETREFEND_PK 
    PRIMARY KEY (ID);    
    
--环节实例归档
CREATE TABLE WF_ACTIVITY_END
(
  ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
  DEFINITION_ID VARCHAR2 (32) NOT NULL ,
  ACTIVITY_NAME VARCHAR2 (100) NOT NULL ,
  ACT_DEF_UNIQUE_ID VARCHAR2 (32) NOT NULL ,
  PROCESS_ID VARCHAR2 (32) NOT NULL ,
  CREATE_TIME CHAR (17) NOT NULL ,
  END_TIME CHAR (17) NOT NULL,
  STATE VARCHAR2 (32),
  MILLIS_CREATE_TIME NUMBER (18,0),
  MILLIS_END_TIME NUMBER (18,0)
);
 ALTER TABLE WF_ACTIVITY_END
    ADD CONSTRAINT WFACTIVITYEND_PK 
    PRIMARY KEY (ACTIVITY_ID);
    
--委派归档
CREATE TABLE WF_ASSIGNMENT_END
(
   ASSIGNMENT_ID VARCHAR2 (32) NOT NULL ,
   ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
   ORGAN_ID VARCHAR2 (32) NOT NULL ,
   ORGAN_NAME VARCHAR2 (100) ,
   ACTUAL_USER_ID VARCHAR2 (32) ,
   ACTUAL_ORGAN_ID VARCHAR2 (32) ,
   ACTUAL_ORGAN_NAME VARCHAR2 (100) ,
   CREATE_TIME CHAR (17) NOT NULL ,
   END_TIME CHAR (17) NOT NULL ,
   MILLIS_CREATE_TIME NUMBER (18,0),
   MILLIS_END_TIME NUMBER (18,0),
   IS_TIMEOUT CHAR (1) DEFAULT '0' NOT NULL
);
 ALTER TABLE WF_ASSIGNMENT_END
    ADD CONSTRAINT WFASSIGNMENTEND_PK 
    PRIMARY KEY (ASSIGNMENT_ID);

--出差代理委派实例归档
CREATE TABLE WF_TRIP_PROXY_ASSIGNMENT_END  
( 
    ID                 	VARCHAR(32) NOT NULL,
    PROCESS_ID VARCHAR (32) ,
    ACTIVITY_ID VARCHAR (32) ,
    ASSIGNMENT_ID        	VARCHAR(32) NOT NULL,
    ORIGINAL_ORGAN_ID      VARCHAR(32) NOT NULL,
    ORIGINAL_ORGAN_NAME  	VARCHAR(100) NOT NULL,
    PROXY_ORGAN_ID	 VARCHAR(32) NOT NULL,
    PROXY_ORGAN_NAME   	VARCHAR(100) NOT NULL
);
ALTER TABLE WF_TRIP_PROXY_ASSIGNMENT_END
    ADD CONSTRAINT TRIPPROXYASSENDPK 
    PRIMARY KEY (ID);

--迁移归档
CREATE TABLE WF_TRANSITION_END
(
    ID VARCHAR2 (32) NOT NULL ,
    ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
    PRE_ACTIVITY_ID VARCHAR2 (32) ,
    CREATE_TIME CHAR (17) NOT NULL ,
    PRE_ACTIVITY_NAME VARCHAR2 (100) ,
    ACTIVITY_NAME VARCHAR2 (100) 
);
 ALTER TABLE WF_TRANSITION_END
    ADD CONSTRAINT WFTRANSITIONEND_PK 
    PRIMARY KEY (ID);
    
--相关数据归档
CREATE TABLE WF_DATA_FIELD_END 
(
   ID VARCHAR2(32) NOT NULL,
   VALUE VARCHAR2(255) NOT NULL,
   PROCESS_ID VARCHAR2(32) NOT NULL, 
   DATA_FIELD_DEF_UNIQUE_ID VARCHAR2(32) NOT NULL,
   DATA_FIELD_DEF_ID 	VARCHAR2(32) NOT NULL
);
ALTER TABLE WF_DATA_FIELD_END 
   ADD CONSTRAINT DATAFLDENDPK 
   PRIMARY KEY(ID);

--流程挂起事件记录归档
CREATE TABLE WF_PROCESS_SUSPEND_EVENT_END
(
	EVENT_ID VARCHAR2(32) NOT NULL,
	PROCESS_ID VARCHAR2(32) NOT NULL,
	SUSPEND_TIME CHAR(17) NOT NULL
);
ALTER TABLE WF_PROCESS_SUSPEND_EVENT_END
	ADD CONSTRAINT PROC_SD_EVT_END_PK
    PRIMARY KEY(EVENT_ID);

--流程恢复事件记录归档
CREATE TABLE WF_PROCESS_RESUME_EVENT_END
(
	EVENT_ID VARCHAR2(32) NOT NULL,
	SUSPEND_EVENT_ID VARCHAR2(32) NOT NULL,
	PROCESS_ID VARCHAR2(32) NOT NULL,
	RESUME_TIME CHAR(17) NOT NULL
);
ALTER TABLE WF_PROCESS_RESUME_EVENT_END
	ADD CONSTRAINT PROC_RM_EVT_END_PK
    PRIMARY KEY(EVENT_ID);

--环节挂起事件记录归档
CREATE TABLE WF_ACTIVITY_SUSPEND_EVENT_END
(
	EVENT_ID VARCHAR2(32) NOT NULL,
	ACTIVITY_ID VARCHAR2(32) NOT NULL,
	SUSPEND_TIME CHAR(17) NOT NULL
);
ALTER TABLE WF_ACTIVITY_SUSPEND_EVENT_END
	ADD CONSTRAINT ACT_SD_EVT_END_PK
    PRIMARY KEY(EVENT_ID);

--环节恢复事件记录归档
CREATE TABLE WF_ACTIVITY_RESUME_EVENT_END
(
	EVENT_ID VARCHAR2(32) NOT NULL,
	SUSPEND_EVENT_ID VARCHAR2(32) NOT NULL,
	ACTIVITY_ID VARCHAR2(32) NOT NULL,
	RESUME_TIME CHAR(17) NOT NULL
);
ALTER TABLE WF_ACTIVITY_RESUME_EVENT_END
	ADD CONSTRAINT ACT_RM_EVT_END_PK
    PRIMARY KEY(EVENT_ID);

--环节迁移退回归档
CREATE TABLE WF_TRANSITION_BACK_END
(
    ID VARCHAR2 (32) NOT NULL,
    ACTIVITY_ID VARCHAR2 (32) NOT NULL,
    PRE_ACTIVITY_ID VARCHAR2 (32),
    CREATE_TIME CHAR (17) NOT NULL,
    PRE_ACTIVITY_NAME VARCHAR2 (100),
    ACTIVITY_NAME VARCHAR2 (100),
    ACTIVITY_REF_ID VARCHAR (32)
);
ALTER TABLE WF_TRANSITION_BACK_END
    ADD CONSTRAINT TRANS_BACK_END_PK 
    PRIMARY KEY (ID);

--流程限时归档
CREATE TABLE WF_PROCESS_LIMIT_END
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            LIMIT_TIME CHAR (17) NOT NULL ,
            MILLIS_LIMIT_TIME NUMBER (18,0) NOT NULL 
);
ALTER TABLE WF_PROCESS_LIMIT_END
    ADD CONSTRAINT PROCESSLIMITEND_PK 
    PRIMARY KEY (ID);

--流程预警归档
CREATE TABLE WF_PROCESS_WARN_END
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            WARN_TIME CHAR (17) NOT NULL ,
            MILLIS_WARN_TIME NUMBER (18,0) NOT NULL 
);
 ALTER TABLE WF_PROCESS_WARN_END
    ADD CONSTRAINT PROCESSWARNEND_PK 
    PRIMARY KEY (ID);

--环节组限时归档
CREATE TABLE WF_ACT_SET_LIMIT_END(
	ID VARCHAR (32) NOT NULL , 
	PROCESS_ID VARCHAR (32) NOT NULL ,
	ACT_SET_ID VARCHAR (32) NOT NULL ,
	LIMIT_TIME CHAR (17) NOT NULL , 
	MILLIS_LIMIT_TIME DECIMAL (18,0) NOT NULL 
);
ALTER TABLE WF_ACT_SET_LIMIT_END
    ADD CONSTRAINT ACTSETLIMITEND_PK 
    PRIMARY KEY (ID);

--环节组预警归档
CREATE TABLE WF_ACT_SET_WARN_END(
	ID VARCHAR (32) NOT NULL ,
	PROCESS_ID VARCHAR (32) NOT NULL , 
	ACT_SET_ID VARCHAR (32) NOT NULL , 
	WARN_TIME CHAR (17) NOT NULL , 
	MILLIS_WARN_TIME DECIMAL (18,0) NOT NULL  
);
ALTER TABLE WF_ACT_SET_WARN_END
    ADD CONSTRAINT ACTSETWARNEND_PK 
    PRIMARY KEY (ID);
    
--环节限时归档
CREATE TABLE WF_ACTIVITY_LIMIT_END
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
            LIMIT_TIME CHAR (17) NOT NULL ,
            MILLIS_LIMIT_TIME NUMBER (18,0) NOT NULL 
);
ALTER TABLE WF_ACTIVITY_LIMIT_END
    ADD CONSTRAINT ACTIVITYLIMITENDPK 
    PRIMARY KEY (ID);

--环节预警归档
CREATE TABLE WF_ACTIVITY_WARN_END
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            ACTIVITY_ID VARCHAR2 (32) NOT NULL ,
            WARN_TIME CHAR (17) NOT NULL ,
            MILLIS_WARN_TIME NUMBER (18,0) NOT NULL 
);
 ALTER TABLE WF_ACTIVITY_WARN_END
    ADD CONSTRAINT ACTIVITYWARNEND_PK 
    PRIMARY KEY (ID);



----------------------统一任务列表----------------
--系统全局任务标题与流程关联
CREATE TABLE WF_PROC_SYS_SUBJECT
(
            ID VARCHAR2 (32) NOT NULL ,
            PROCESS_ID VARCHAR2 (32) NOT NULL ,
            SUBJECT_KEY VARCHAR2 (32) NOT NULL ,
            SUBJECT_ALIAS VARCHAR2 (100) NOT NULL 
);
ALTER TABLE WF_PROC_SYS_SUBJECT
    ADD CONSTRAINT PROCSYSSUBJECT_PK 
    PRIMARY KEY (ID);

--20111126创建流程统计分析功能视图
CREATE VIEW WF_PROCESS_ANALYSIS_VIEW AS 
SELECT DEFINITION_ID,
       PROCESS_NAME,
       PROCESS_ID,
      (MILLIS_END_TIME - MILLIS_CREATE_TIME)/3600000 AS USETIME,   
       TO_NUMBER(IS_TIMEOUT) AS IS_TIMEOUT,
       SUBSTR(CREATE_TIME,1,6) AS CREATE_TIME_MONTH
FROM WF_PROCESS_END;

CREATE VIEW WF_ASSIGNMENT_ANALYSE_VIEW AS
SELECT ASSIGNMENT_ID,
       ACTUAL_ORGAN_ID,
       ACTUAL_ORGAN_NAME,
       SUBSTR(END_TIME,1,6) AS END_TIME_MONTH,
 (MILLIS_END_TIME - MILLIS_CREATE_TIME)/3600000 AS USETIME,
       TO_NUMBER(IS_TIMEOUT) AS IS_TIMEOUT
FROM WF_ASSIGNMENT_END;

--环节所关联的环节组的限时、预警视图
CREATE VIEW WF_ACT_SET_REF_VIEW AS 
SELECT WF_ACT_SET_REF.ACTIVITY_ID, WF_ACT_SET_REF.PROCESS_ID, WF_ACT_SET_REF.ACT_SET_ID, WF_ACT_SET_REF.ACT_SET_DEF_ID, 
WF_ACT_SET_REF.ACT_SET_DEF_NAME, WF_ACT_SET_LIMIT.LIMIT_TIME AS ACT_SET_LIMIT, WF_ACT_SET_WARN.WARN_TIME AS ACT_SET_WARN 
FROM WF_ACT_SET_REF
LEFT JOIN WF_ACT_SET_LIMIT ON WF_ACT_SET_LIMIT.ACT_SET_ID=WF_ACT_SET_REF.ACT_SET_ID
LEFT JOIN WF_ACT_SET_WARN ON WF_ACT_SET_WARN.ACT_SET_ID=WF_ACT_SET_REF.ACT_SET_ID;