{{ config(materialized='table') }}
Select * FROM {{source('DW_Adventureworks','production_product')}}