with detail as (
    select *
    from {{ref('stg_sales_salesorderdetail')}}
)
   , header as (
    select * 
    from {{ref('stg_sales_salesorderheader')}}
)
    , sales as (
    select detail.salesorderid,
           detail.salesorderdetailid,
           detail.orderqty,
           detail.productid, 
           header.orderdate,
           header.customerid
    FROM detail
    left join detail on
       detail.salesorderid = 
       header.salesorderid

    )

select * from sales







