with silver as (

    -- Existing country reference data
    select
        {{ upper_column(trim_column('countrycode')) }} as countrycode,
        {{ upper_column(trim_column('iso3code')) }} as iso3code,
        {{ trim_column('countryname') }} as countryname,
        {{ trim_column('region') }} as region,
        {{ trim_column('subregion') }} as subregion,
        {{ trim_column('continent') }} as continent,
        {{ upper_column(trim_column('currencycode')) }} as currencycode,
        {{ lower_column(trim_column('primarylanguage')) }} as primarylanguage,
        {{ trim_column('timezone') }} as timezone,
        {{ trim_column('callingcode') }} as callingcode,
        {{ cast_bool('isactive') }} as isactive,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('countries') }}

    union all

    -- Inferred country members:
    -- Add country codes used by the data but missing from the country reference table.
    select
        missing.countrycode,
        null as iso3code,
        'UNKNOWN' as countryname,
        'UNKNOWN' as region,
        'UNKNOWN' as subregion,
        'UNKNOWN' as continent,
        null as currencycode,
        null as primarylanguage,
        null as timezone,
        null as callingcode,
        false as isactive,
        current_timestamp() as inserted_at,
        current_timestamp() as updated_at,
        'INFERRED' as source_name

    from (

        select distinct upper(trim(cast(countrycode as string))) as countrycode
        from {{ ref('players') }}

        union distinct

        select distinct upper(trim(cast(countrycode as string)))
        from {{ ref('game_sessions') }}

        union distinct

        select distinct upper(trim(cast(countrycode as string)))
        from {{ ref('player_events') }}

        union distinct

        select distinct upper(trim(cast(countrycode as string)))
        from {{ ref('installs') }}

        union distinct

        select distinct upper(trim(cast(countrycode as string)))
        from {{ ref('in_app_purchases') }}

        union distinct

        select distinct upper(trim(cast(countrycode as string)))
        from {{ ref('ad_interactions') }}

        union distinct

        select distinct upper(trim(cast(targetcountrycode as string)))
        from {{ ref('campaigns') }}

    ) missing

    where missing.countrycode is not null
      and missing.countrycode != ''

      and not exists (

          select 1
          from {{ ref('countries') }} c
          where upper(trim(cast(c.countrycode as string))) = missing.countrycode

      )

)

select * from silver