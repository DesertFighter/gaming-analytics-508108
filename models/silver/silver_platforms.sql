with silver as (

    select
        {{ upper_column(trim_column('platformcode')) }} as platformcode,
        {{ trim_column('platformname') }} as platformname,
        {{ trim_column('platformcategory') }} as platformcategory,
        {{ trim_column('storename') }} as storename,
        {{ trim_column('operatingsystemfamily') }} as operatingsystemfamily,
        {{ trim_column('vendorname') }} as vendorname,
        {{ trim_column('storeurl') }} as storeurl,
        {{ cast_bool('ismobile') }} as ismobile,
        {{ cast_bool('isactive') }} as isactive,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('platforms') }}

)

select * from silver