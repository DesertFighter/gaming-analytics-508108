with source as (
       
           select * from {{ source('gaming_landing', 'ad_interactions') }}
       
       ),
       
       renamed as (
       
           select
               adeventid,
               playerid,
               gameid,
               deviceid,
               platformcode,
               countrycode,
               campaignid,
               mediasourceid,
               adnetworkid,
               datekey,
               adid,
               adtype,
               adplacement,
               eventtype,
               impressiontimestamp,
               clicktimestamp,
               conversiontimestamp,
               revenueamount,
               costamount,
               currencycode,
               wasclicked,
               wasconverted,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed