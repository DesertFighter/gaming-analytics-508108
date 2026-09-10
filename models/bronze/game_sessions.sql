with source as (
       
           select * from {{ source('gaming_landing', 'game_sessions') }}
       
       ),
       
       renamed as (
       
           select
               sessionid,
               playerid,
               gameid,
               deviceid,
               platformcode,
               countrycode,
               datekey,
               sessionstarttimestamp,
               sessionendtimestamp,
               sessiondurationseconds,
               levelsplayed,
               levelscompleted,
               scoreearned,
               experiencepointsearned,
               eventsgenerated,
               iscompleted,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed