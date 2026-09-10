 with source as (
       
           select * from {{ source('gaming_landing', 'ad_networks') }}
       
       ),
       
       renamed as (
       
           select
               adnetworkid,
               adnetworkcode,
               adnetworkname,
               networktype,
               accountname,
               accountemail,
               pricingmodel,
               defaultcurrency,
               website,
               isactive,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed