{% snapshot snap_players %}

{{
    config(
        unique_key='playerid',
        strategy='timestamp',
        updated_at='updated_at',
        hard_deletes='invalidate'
    )
}}

select *
from {{ ref('silver_players') }}

{% endsnapshot %}