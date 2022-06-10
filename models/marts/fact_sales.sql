{{ config(materialized='table') }}
with detail as (
    select *
    from {{ref('stg_sales_salesorderdetail')}}
)
   , header as (
    select * 
    from {{ref('stg_sales_salesorderheader')}}
)
   , reason as (
       select * 
    from {{ref('stg_sales_salesorderheadersalesreason')}}
)  
   , customer as (
       select * 
    from {{ref('stg_sales_customer')}}
)   
   , creditcard as (
       select * 
    from {{ref('stg_sales_personcreditcard')}}
)
   , sales as (
    select detail.salesorderid,
           detail.salesorderdetailid,
           detail.carriertrackingnumber,
           detail.orderqty,
           detail.productid,
           detail.specialofferid,
           detail.unitprice,
           detail.unitpricediscount,
           creditcard.creditcardid
    FROM detail
    left join header on
       detail.salesorderid = 
       header.salesorderid
    left join reason on
       header.salesorderid =
       reason.salesorderid 
    left join customer on
        customer.customerid =
        header.customerid
    left join creditcard on 
        creditcard.creditcardid =
        header.creditcardid    
        
)

select * from sales







