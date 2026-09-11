 with source as (
       
           select * from {{ source('gaming_landing', 'players') }}
       
       ),
       
       renamed as (
       
           select
               playerid,
               username,
               firstname,
               lastname,
               email,
               mobilenumber,
               birthday,
               gender,
               addressline1,
               addressline2,
               city,
               postcode,
               countrycode,
               preferredlanguage,
               registrationdate,
               accountstatus,
               viplevel,
               marketingconsent,
               isactive,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed