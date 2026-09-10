 with source as (
       
           select * from {{ source('gaming_landing', 'campaigns') }}
       
       ),
       
       renamed as (
       
           select
               campaignid,
               campaigncode,
               campaignname,
               campaigntype,
               campaignobjective,
               startdate,
               enddate,
               budgetamount,
               currencycode,
               targetcountrycode,
               targetplatformcode,
               campaignstatus,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed