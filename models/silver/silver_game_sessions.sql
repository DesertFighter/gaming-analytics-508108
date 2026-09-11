with silver as (

    select
        {{ trim_column('sessionid') }} as sessionid,
        {{ cast_string('playerid') }} as playerid,
        {{ cast_string('gameid') }} as gameid,
        {{ cast_string('deviceid') }} as deviceid,
        {{ upper_column(trim_column('platformcode')) }} as platformcode,
        {{ upper_column(trim_column('countrycode')) }} as countrycode,
        datekey,
        {{ cast_timestamp('sessionstarttimestamp') }} as sessionstarttimestamp,
        {{ cast_timestamp('sessionendtimestamp') }} as sessionendtimestamp,
        sessiondurationseconds,
        levelsplayed,
        levelscompleted,
        scoreearned,
        experiencepointsearned,
        eventsgenerated,
        {{ cast_bool('iscompleted') }} as iscompleted,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('game_sessions') }} s

    where exists (
        select 1
        from {{ ref('silver_players') }} p
        where cast(s.playerid as string) = p.playerid
    )

    and exists (
        select 1
        from {{ ref('silver_countries') }} c
        where upper(trim(cast(s.countrycode as string))) = c.countrycode
    )
    and (
    s.sessionstarttimestamp is null
    or s.sessionendtimestamp is null
    or s.sessionendtimestamp >= s.sessionstarttimestamp
)

)

select * from silver