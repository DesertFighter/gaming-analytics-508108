with source as (
       
           select * from {{ source('gaming_landing', 'player_events') }}
       
       ),
       
       renamed as (
       
           select
               inserted_at,
               sequencenumber,
               eventvalue,
               levelnumber,
               playerid,
               eventtype,
               updated_at,
               eventpropertiesjson,
               datekey,
               eventname,
               sessionid,
               platformcode,
               deviceid,
               issuccessful,
               eventtimestamp,
               source_name,
               gameid,
               countrycode,
               eventid
       
           from source
       
       )
       
       select * from renamed