with silver as (

    select
        {{ trim_column('subcategoryid') }} as subcategoryid,
        {{ trim_column('categoryid') }} as categoryid,
        {{ upper_column(trim_column('subcategorycode')) }} as subcategorycode,
        {{ trim_column('subcategoryname') }} as subcategoryname,
        {{ trim_column('subcategorydescription') }} as subcategorydescription,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('product_subcategories') }}

)

select * from silver