 with source as (
       
           select * from {{ source('gaming_landing', 'products') }}
       
       ),
       
       renamed as (
       
           select
               productid,
               productcode,
               productname,
               subcategoryid,
               producttype,
               description,
               defaultprice,
               currencycode,
               isconsumable,
               isactive,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed