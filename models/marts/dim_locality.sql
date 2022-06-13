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
   , locality as (
       select personaddress.addressid,
              personaddress.addressline1,
              personaddress.city,
              personaddress.postalcode,
              stateprovince.stateprovinceid,
              stateprovince.stateprovincecode,
              stateprovince.countryregioncode,
              stateprovince.name,
              countryregion.name
       from personaddress
        left join stateprovince on 
            personaddress.stateprovinceid =
            stateprovince.stateprovinceid
        left join countryregion on 
            countryregion.countryregioncode = 
            stateprovince.countryregioncode
   ) 

select * from locality
