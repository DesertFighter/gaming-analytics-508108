with silver as (

    select
        {{ trim_column('mediasourceid') }} as mediasourceid,
        {{ upper_column(trim_column('mediasourcecode')) }} as mediasourcecode,
        {{ trim_column('mediasourcename') }} as mediasourcename,
        {{ trim_column('providername') }} as providername,
        {{ trim_column('channeltype') }} as channeltype,
        {{ trim_column('traffictype') }} as traffictype,
        {{ trim_column('attributionprovider') }} as attributionprovider,
        {{ cast_bool('ispaid') }} as ispaid,
        {{ cast_bool('isactive') }} as isactive,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('media_sources') }}

)

select * from silver