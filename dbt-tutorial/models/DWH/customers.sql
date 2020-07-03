



WITH cust_order as (
    SELECT
        custkey
        , min(O_ORDERDATE) as first_date
        , max(O_ORDERDATE) as last_date
        ,count(O_ORDERKEY) as number_of_orders
        ,SUM(O_TOTALPRICE) as total_price
  FROM {{ ref('stg_orders')}}
  group by custkey
)

SELECT 
    cust.C_NAME
    ,cust_order.* 
FROM cust_order
INNER JOIN {{ref('stg_customers')}} cust
    using (custkey)