with source as (
       
           select * from {{ source('gaming_landing', 'platforms') }}
       
       ),
       
       renamed as (
       
           select
               platformcode,
               platformname,
               platformcategory,
               storename,
               operatingsystemfamily,
               vendorname,
               storeurl,
               ismobile,
               isactive,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed