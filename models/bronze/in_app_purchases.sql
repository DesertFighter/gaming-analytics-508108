with source as (
       
           select * from {{ source('gaming_landing', 'in_app_purchases') }}
       
       ),
       
       renamed as (
       
           select
               transactionid,
               playerid,
               gameid,
               deviceid,
               platformcode,
               countrycode,
               datekey,
               productid,
               quantity,
               unitprice,
               grossamount,
               discountamount,
               taxamount,
               netamount,
               currencycode,
               purchasetimestamp,
               paymentmethod,
               paymentstatus,
               isrefunded,
               refundamount,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed