{{ config(materialized='table') }}
with personaddress as (
    select *
    from {{ref('stg_person_address')}}
)
   , stateprovince as (
    select * 
    from {{ref('stg_person_stateprovince')}}
)
   , countryregion as (
    select *
    from {{ref('stg_countryregion')}}
) 
   , person as (
    select *
    from {{ref('stg_person_person')}}
) 
   , businessentityaddress as (
    select *
    from {{ref('stg_person_businessentityaddress')}}
) 
   , locality as (
       select personaddress.addressid,
              personaddress.addressline1,
              personaddress.city,
              personaddress.postalcode,
              stateprovince.stateprovinceid,
              stateprovince.stateprovincecode,
              stateprovince.countryregioncode,
              stateprovince.name as provincename,
              countryregion.name,
              businessentityaddress.businessentityid
       from personaddress
        left join stateprovince on 
            personaddress.stateprovinceid =
            stateprovince.stateprovinceid
        left join countryregion on 
            countryregion.countryregioncode = 
            stateprovince.countryregioncode
        left join businessentityaddress on
            businessentityaddress.addressid =
            personaddress.addressid 

   ) 

select * from locality
