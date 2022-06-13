{{ config(materialized='table') }}
with salescustomer as (
    select *
    from {{ref('stg_sales_customer')}}
)
   , person as (
    select * 
    from {{ref('stg_person_person')}}
)
   , customers as (
       select salescustomer.customerid,
              salescustomer.storeid,
              salescustomer.territoryid,
              person.businessentityid,
              person.persontype,
              person.firstname,
              person.lastname  
       from salescustomer
       left join person on
        salescustomer.personid = 
        person.businessentityid
   ) 

select * from customers


