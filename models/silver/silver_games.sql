with silver as (

    select
        {{ trim_column('gameid') }} as gameid,
        {{ upper_column(trim_column('gamecode')) }} as gamecode,
        {{ trim_column('gamename') }} as gamename,
        {{ trim_column('genre') }} as genre,
        {{ trim_column('developer') }} as developer,
        {{ trim_column('publisher') }} as publisher,
        releasedate,
        {{ trim_column('agerating') }} as agerating,
        {{ trim_column('currentversion') }} as currentversion,
        {{ trim_column('gamemode') }} as gamemode,
        {{ cast_bool('ismultiplayer') }} as ismultiplayer,
        {{ upper_column(trim_column('supportedplatform')) }} as supportedplatform,
        {{ trim_column('gamestatus') }} as gamestatus,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('games') }}

)

select * from silver