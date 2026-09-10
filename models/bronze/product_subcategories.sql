with source as (
       
           select * from {{ source('gaming_landing', 'product_subcategories') }}
       
       ),
       
       renamed as (
       
           select
               subcategoryid,
               categoryid,
               subcategorycode,
               subcategoryname,
               subcategorydescription,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed