--{{ config( materialized='view' ) }}

SELECT
    C_CUSTKEY as custkey
    ,C_NAME
FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER"
