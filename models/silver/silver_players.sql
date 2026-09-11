{{ config(
    materialized='incremental',
    unique_key='playerid',
    incremental_strategy='merge',
    on_schema_change='append_new_columns'
) }}

with silver as (

    select
        {{ cast_string('playerid') }} as playerid,
        {{ lower_column(trim_column('username')) }} as username,
        {{ trim_column('firstname') }} as firstname,
        {{ trim_column('lastname') }} as lastname,
        concat(firstname, ' ', lastname) as fullname,
        {{ lower_column(trim_column('email')) }} as email,
        {{ trim_column('mobilenumber') }} as mobilenumber,
        birthday,
        {{ trim_column('gender') }} as gender,
        {{ trim_column('addressline1') }} as addressline1,
        {{ trim_column('addressline2') }} as addressline2,
        {{ trim_column('city') }} as city,
        {{ trim_column('postcode') }} as postcode,
        {{ upper_column(trim_column('countrycode')) }} as countrycode,
        {{ lower_column(trim_column('preferredlanguage')) }} as preferredlanguage,
        registrationdate,
        {{ trim_column('accountstatus') }} as accountstatus,
        {{ cast_string('viplevel') }} as viplevel,
        {{ cast_bool('marketingconsent') }} as marketingconsent,
        {{ cast_bool('isactive') }} as isactive,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('players') }} p

    {% if is_incremental() %}

    where p.updated_at >= (
        select coalesce(
            max(updated_at),
            timestamp('1900-01-01')
        )
        from {{ this }}
    )

    {% endif %}

    -- Deduplication:
    -- Keep only the latest record for each PlayerID.
    qualify row_number() over (
        partition by p.playerid
        order by p.updated_at desc, p.inserted_at desc
    ) = 1

)

select * from silver