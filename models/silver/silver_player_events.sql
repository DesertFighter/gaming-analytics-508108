{{ config(
    materialized='incremental',
    unique_key='eventid',
    incremental_strategy='merge',

    partition_by={
        "field": "eventtimestamp",
        "data_type": "timestamp",
        "granularity": "day"
    },

    cluster_by=['playerid', 'gameid']
) }}

with silver as (

    select
        {{ trim_column('eventid') }} as eventid,
        {{ cast_string('playerid') }} as playerid,
        {{ cast_string('gameid') }} as gameid,
        {{ cast_string('deviceid') }} as deviceid,
        {{ upper_column(trim_column('platformcode')) }} as platformcode,
        {{ upper_column(trim_column('countrycode')) }} as countrycode,
        {{ cast_string('sessionid') }} as sessionid,
        datekey,
        {{ trim_column('eventname') }} as eventname,
        {{ upper_column(trim_column('eventtype')) }} as eventtype,
        {{ cast_timestamp('eventtimestamp') }} as eventtimestamp,
        levelnumber,
        eventvalue,

        eventpropertiesjson as eventpropertiesjson_raw,

        safe.parse_json(eventpropertiesjson) as eventpropertiesjson,

        case
            when eventpropertiesjson is null then false
            when safe.parse_json(eventpropertiesjson) is not null then true
            else false
        end as is_json_valid,

        json_value(
            safe.parse_json(eventpropertiesjson),
            '$.achievement_id'
        ) as achievement_id,

        safe_cast(
            json_value(
                safe.parse_json(eventpropertiesjson),
                '$.points'
            ) as int64
        ) as points,

        sequencenumber,
        {{ cast_bool('issuccessful') }} as issuccessful,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('player_events') }} player_events

    -- Referential Integrity: Session must exist
    where exists (
        select 1
        from {{ ref('silver_game_sessions') }} game_sessions
        where cast(player_events.sessionid as string) = game_sessions.sessionid
    )

    -- Referential Integrity: Country must exist
    and exists (
        select 1
        from {{ ref('silver_countries') }} countries
        where upper(trim(cast(player_events.countrycode as string))) = countries.countrycode
    )

)

select * from silver