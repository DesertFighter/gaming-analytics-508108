with silver as (

    select
        {{ trim_column('productid') }} as productid,
        {{ upper_column(trim_column('productcode')) }} as productcode,
        {{ trim_column('productname') }} as productname,
        {{ trim_column('subcategoryid') }} as subcategoryid,
        {{ trim_column('producttype') }} as producttype,
        {{ trim_column('description') }} as description,
        {{ cast_numeric('defaultprice') }} as defaultprice,
        {{ upper_column(trim_column('currencycode')) }} as currencycode,
        {{ cast_bool('isconsumable') }} as isconsumable,
        {{ cast_bool('isactive') }} as isactive,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('products') }}

)

select * from silver