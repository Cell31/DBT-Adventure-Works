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
   , salesreason as (
       select * 
    from {{ref('stg_sales_salesreason')}}
)  
   , sales as (
    select detail.salesorderid,
           detail.salesorderdetailid,
           header.customerid,
           header.orderdate,
           detail.orderqty,
           detail.productid,
           detail.specialofferid,
           detail.unitprice,
           detail.unitpricediscount,
           creditcard.creditcardid,
           creditcard.cardtype,
           reason.salesreasonid,
           salesreason.name
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
    left join salesreason on
        salesreason.salesreasonid =
        reason.salesreasonid

)

select * from sales







