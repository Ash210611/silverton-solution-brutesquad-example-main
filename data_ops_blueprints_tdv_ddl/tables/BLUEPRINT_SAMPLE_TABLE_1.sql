--liquibase formatted sql

--changeset Hinds:HSETL_WORK${dbEnv}.tables.BLUEPRINT_SAMPLE_TABLE_1 runAlways:false runOnChange:true labels:eds context:dev,test,prod
--comment: Create table HSETL_WORK${dbEnv}.BLUEPRINT_SAMPLE_TABLE_1

------------------------------------------------------------------------------------------
CREATE MULTISET TABLE HSETL_WORK${dbEnv}.BLUEPRINT_SAMPLE_TABLE_1,
NO FALLBACK,
NO BEFORE JOURNAL,
NO AFTER JOURNAL,
CHECKSUM = DEFAULT,
DEFAULT MERGEBLOCKRATIO,
MAP = TD_MAP1  (
    ETL_LOAD_DT_TM TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    ETL_LAST_UPDT_DT_TM TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    ETL_HASH_VAL VARCHAR(255) CHARACTER SET UNICODE NOT CASESPECIFIC,
    ETL_NK_HASH_VAL VARCHAR(255) CHARACTER SET UNICODE NOT CASESPECIFIC,
    CLM_ID VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
    DIAGS_SEQ INTEGER NOT NULL,
    DIAGS_TY_CD VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
    SYS_ICD_DIAGS_CD VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
    SRC_DATA_KEY INTEGER NOT NULL DEFAULT -1 ,
    SYS_ICD_DIAGS_CD_VRSN INTEGER NOT NULL,
    SYS_ICD_DIAGS_CD_DESC VARCHAR(500) CHARACTER SET UNICODE NOT CASESPECIFIC,
    DIAGS_TY_CD_DESC VARCHAR(255) CHARACTER SET UNICODE NOT CASESPECIFIC,
    SYS_POA_CD VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
    SYS_POA_CD_DESC VARCHAR(255) CHARACTER SET UNICODE NOT CASESPECIFIC,
    TENANT_CD VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL DEFAULT 'UNUNUNUN',
    IS_ENCNTR_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
    CLM_ICD_DIAGS_CD_VRSN CHAR(2) CHARACTER SET UNICODE NOT CASESPECIFIC,
    SRC_DATA_DESC VARCHAR(255) CHARACTER SET UNICODE NOT CASESPECIFIC,
    SYS_ICD_DIAG_CD_QUALR_CD VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
    SYS_ICD_DIAG_CD_QUALR_DESC VARCHAR(255) CHARACTER SET UNICODE NOT CASESPECIFIC
)
PRIMARY INDEX ( CLM_ID ,DIAGS_SEQ ,DIAGS_TY_CD );

COLLECT STATISTICS
                   -- default SYSTEM SAMPLE PERCENT
                   -- default SYSTEM THRESHOLD PERCENT
            COLUMN ( CLM_ID,DIAGS_SEQ,DIAGS_TY_CD ) ,
            COLUMN ( CLM_ID ) ,
            COLUMN ( DIAGS_SEQ ) ,
            COLUMN ( DIAGS_TY_CD ) ,
            COLUMN ( SYS_ICD_DIAGS_CD ) ,
            COLUMN ( SRC_DATA_KEY ) ,
            COLUMN ( SYS_ICD_DIAGS_CD_VRSN )
                ON HSETL_WORK${dbEnv}.BLUEPRINT_SAMPLE_TABLE_1;

--rollback DROP TABLE HSETL_WORK${dbEnv}.BLUEPRINT_SAMPLE_TABLE_1;