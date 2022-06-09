with detail as (
    select *
    from {{ref('stg_sales_salesorderdetail')}}
)
   , header as (
    select * 
    from {{ref('stg_sales_salesorderheader')}}
)
   , sales as (
    select salesorderid,
           salesorderdetailid,
           carriertrackingnumber,
           orderqty,
           productid,
           specialofferid,
           unitprice,
           unitpricediscount 
    FROM detail
    left join header on
       detail.salesorderid = 
       header.salesorderid

    )

select * from sales







