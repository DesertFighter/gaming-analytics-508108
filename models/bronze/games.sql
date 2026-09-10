with source as (
       
           select * from {{ source('gaming_landing', 'games') }}
       
       ),
       
       renamed as (
       
           select
               gameid,
               gamecode,
               gamename,
               genre,
               developer,
               publisher,
               releasedate,
               agerating,
               currentversion,
               gamemode,
               ismultiplayer,
               supportedplatform,
               gamestatus,
               inserted_at,
               updated_at,
               source_name
       
           from source
       
       )
       
       select * from renamed