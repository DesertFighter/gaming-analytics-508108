with source as (
       
           select * from {{ source('gaming_landing', 'installs') }}
       
       ),
       
       renamed as (
       
           select
               installid,
               playerid,
               gameid,
               deviceid,
               platformcode,
               countrycode,
               campaignid,
               mediasourceid,
               adnetworkid,
               datekey,
               appsflyerid,
               installtimestamp,
               clicktimestamp,
               impressiontimestamp,
               attributiontype,
               isorganic,
               acquisitioncost,
               currencycode,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed