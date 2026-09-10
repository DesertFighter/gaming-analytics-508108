with source as (
       
           select * from {{ source('gaming_landing', 'product_categories') }}
       
       ),
       
       renamed as (
       
           select
               categoryid,
               categorycode,
               categoryname,
               categorydescription,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed