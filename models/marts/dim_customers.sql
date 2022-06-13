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
        customers.personid = 
        person.personid
   ) 

select * from customers


