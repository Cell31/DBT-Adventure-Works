{{ config(materialized='table') }}
Select * FROM {{source('DW_Adventureworks','public_customeraddress')}}
