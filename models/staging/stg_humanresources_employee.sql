{{ config(materialized='table') }}
Select * FROM {{source('DW_Adventureworks','humanresources_employee')}}