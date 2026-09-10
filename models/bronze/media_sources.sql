with source as (
       
           select * from {{ source('gaming_landing', 'media_sources') }}
       
       ),
       
       renamed as (
       
           select
               mediasourceid,
               mediasourcecode,
               mediasourcename,
               providername,
               channeltype,
               traffictype,
               attributionprovider,
               ispaid,
               isactive,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed