{{ config(materialized='table') }}
Select * FROM {{source('DW_Adventureworks','person_phonenumbertype')}}
