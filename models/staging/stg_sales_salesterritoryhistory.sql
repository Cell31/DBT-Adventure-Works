{{ config(materialized='table') }}
Select * FROM {{source('DW_Adventureworks','sales_salesterritoryhistory')}}

