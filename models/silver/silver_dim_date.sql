with silver as (

    select
        *
    from {{ ref('dim_date') }}

)

select * from silver