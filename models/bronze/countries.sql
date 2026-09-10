with source as (
       
           select * from {{ source('gaming_landing', 'countries') }}
       
       ),
       
       renamed as (
       
           select
               countrycode,
               iso3code,
               countryname,
               region,
               subregion,
               continent,
               currencycode,
               primarylanguage,
               timezone,
               callingcode,
               isactive,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed