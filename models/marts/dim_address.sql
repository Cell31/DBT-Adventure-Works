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
   , address as (
       select 
       from personaddress
        left join stateprovince on 
            personaddress.stateprovinceid =
            stateprovince.stateprovinceid
        left join countryregion on 
            countryregion.countryregioncode = 
            stateprovince.countryregioncode
   ) 
   