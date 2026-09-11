with rejected as (

    select
        s.*,
        'ORPHAN_PLAYERID' as rejection_reason

    from {{ ref('game_sessions') }} s

    where not exists (
        select 1
        from {{ ref('silver_players') }} p
        where cast(s.playerid as string) = p.playerid
    )

)

select * from rejected