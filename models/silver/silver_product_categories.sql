with silver as (

    select
        {{ trim_column('categoryid') }} as categoryid,
        {{ upper_column(trim_column('categorycode')) }} as categorycode,
        {{ trim_column('categoryname') }} as categoryname,
        {{ trim_column('categorydescription') }} as categorydescription,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('product_categories') }}

)

select * from silver