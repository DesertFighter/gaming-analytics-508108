with silver as (

    select
        {{ trim_column('transactionid') }} as transactionid,
        {{ trim_column('playerid') }} as playerid,
        {{ trim_column('gameid') }} as gameid,
        {{ trim_column('deviceid') }} as deviceid,
        {{ upper_column(trim_column('platformcode')) }} as platformcode,
        {{ upper_column(trim_column('countrycode')) }} as countrycode,
        datekey,
        {{ trim_column('productid') }} as productid,
        quantity,
        {{ cast_numeric('unitprice') }} as unitprice,
        {{ cast_numeric('grossamount') }} as grossamount,
        {{ cast_numeric('discountamount') }} as discountamount,
        {{ cast_numeric('taxamount') }} as taxamount,
        {{ cast_numeric('netamount') }} as netamount,
        {{ upper_column(trim_column('currencycode')) }} as currencycode,
        {{ cast_timestamp('purchasetimestamp') }} as purchasetimestamp,
        {{ trim_column('paymentmethod') }} as paymentmethod,
        {{ trim_column('paymentstatus') }} as paymentstatus,
        {{ cast_bool('isrefunded') }} as isrefunded,
        {{ cast_numeric('refundamount') }} as refundamount,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('in_app_purchases') }} p

    -- Referential Integrity:
    -- Keep only purchases whose ProductID exists in Silver products.
    where exists (
        select 1
        from {{ ref('silver_products') }} product
        where trim(cast(p.productid as string)) = product.productid
    )

)

select * from silver