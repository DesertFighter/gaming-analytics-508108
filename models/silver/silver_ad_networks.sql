with silver as (

    select
        {{ trim_column('adnetworkid') }} as adnetworkid,
        {{ upper_column(trim_column('adnetworkcode')) }} as adnetworkcode,
        {{ trim_column('adnetworkname') }} as adnetworkname,
        {{ trim_column('networktype') }} as networktype,
        {{ trim_column('accountname') }} as accountname,
        {{ lower_column(trim_column('accountemail')) }} as accountemail,
        {{ upper_column(trim_column('pricingmodel')) }} as pricingmodel,
        {{ upper_column(trim_column('defaultcurrency')) }} as defaultcurrency,
        {{ trim_column('website') }} as website,
        {{ cast_bool('isactive') }} as isactive,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('ad_networks') }}

)

select * from silver