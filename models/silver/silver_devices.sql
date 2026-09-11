with silver as (

    select
        {{ trim_column('deviceid') }} as deviceid,
        {{ trim_column('advertisingid') }} as advertisingid,
        {{ trim_column('devicetype') }} as devicetype,
        {{ trim_column('manufacturer') }} as manufacturer,
        {{ trim_column('devicemodel') }} as devicemodel,
        {{ trim_column('operatingsystem') }} as operatingsystem,
        {{ trim_column('osversion') }} as osversion,
        {{ trim_column('appversion') }} as appversion,
        {{ trim_column('screenresolution') }} as screenresolution,
        {{ trim_column('networktype') }} as networktype,
        {{ trim_column('carriername') }} as carriername,
        {{ lower_column(trim_column('devicelanguage')) }} as devicelanguage,
        {{ cast_bool('istablet') }} as istablet,
        {{ cast_bool('isemulator') }} as isemulator,
        {{ upper_column(trim_column('platformcode')) }} as platformcode,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('devices') }}

)

select * from silver