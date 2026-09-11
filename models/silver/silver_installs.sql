with silver as (

    select
        {{ trim_column('installid') }} as installid,
        {{ trim_column('playerid') }} as playerid,
        {{ trim_column('gameid') }} as gameid,
        {{ trim_column('deviceid') }} as deviceid,
        {{ upper_column(trim_column('platformcode')) }} as platformcode,
        {{ upper_column(trim_column('countrycode')) }} as countrycode,
        {{ trim_column('campaignid') }} as campaignid,
        {{ trim_column('mediasourceid') }} as mediasourceid,
        {{ trim_column('adnetworkid') }} as adnetworkid,
        datekey,
        {{ trim_column('appsflyerid') }} as appsflyerid,
        {{ cast_timestamp('installtimestamp') }} as installtimestamp,
        {{ cast_timestamp('clicktimestamp') }} as clicktimestamp,
        {{ cast_timestamp('impressiontimestamp') }} as impressiontimestamp,
        {{ trim_column('attributiontype') }} as attributiontype,
        {{ cast_bool('isorganic') }} as isorganic,
        {{ cast_numeric('acquisitioncost') }} as acquisitioncost,
        {{ upper_column(trim_column('currencycode')) }} as currencycode,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('installs') }}

)

select * from silver