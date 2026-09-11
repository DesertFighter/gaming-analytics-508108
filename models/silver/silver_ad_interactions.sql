with silver as (

    select
        {{ trim_column('adeventid') }} as adeventid,
        {{ trim_column('playerid') }} as playerid,
        {{ trim_column('gameid') }} as gameid,
        {{ trim_column('deviceid') }} as deviceid,
        {{ upper_column(trim_column('platformcode')) }} as platformcode,
        {{ upper_column(trim_column('countrycode')) }} as countrycode,
        {{ trim_column('campaignid') }} as campaignid,
        {{ trim_column('mediasourceid') }} as mediasourceid,
        {{ trim_column('adnetworkid') }} as adnetworkid,
        datekey,
        {{ trim_column('adid') }} as adid,
        {{ trim_column('adtype') }} as adtype,
        {{ trim_column('adplacement') }} as adplacement,
        {{ upper_column(trim_column('eventtype')) }} as eventtype,
        {{ cast_timestamp('impressiontimestamp') }} as impressiontimestamp,
        {{ cast_timestamp('clicktimestamp') }} as clicktimestamp,
        {{ cast_timestamp('conversiontimestamp') }} as conversiontimestamp,
        {{ cast_numeric('revenueamount') }} as revenueamount,
        {{ cast_numeric('costamount') }} as costamount,
        {{ upper_column(trim_column('currencycode')) }} as currencycode,
        {{ cast_bool('wasclicked') }} as wasclicked,
        {{ cast_bool('wasconverted') }} as wasconverted,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('ad_interactions') }}

)

select * from silver