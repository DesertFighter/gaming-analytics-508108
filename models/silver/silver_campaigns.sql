with silver as (

    select
        {{ trim_column('campaignid') }} as campaignid,
        {{ upper_column(trim_column('campaigncode')) }} as campaigncode,
        {{ trim_column('campaignname') }} as campaignname,
        {{ trim_column('campaigntype') }} as campaigntype,
        {{ trim_column('campaignobjective') }} as campaignobjective,
        startdate,
        enddate,
        {{ cast_numeric('budgetamount') }} as budgetamount,
        {{ upper_column(trim_column('currencycode')) }} as currencycode,
        {{ upper_column(trim_column('targetcountrycode')) }} as targetcountrycode,
        {{ upper_column(trim_column('targetplatformcode')) }} as targetplatformcode,
        {{ trim_column('campaignstatus') }} as campaignstatus,
        {{ cast_timestamp('inserted_at') }} as inserted_at,
        {{ cast_timestamp('updated_at') }} as updated_at,
        {{ upper_column(trim_column('source_name')) }} as source_name

    from {{ ref('campaigns') }}

)

select * from silver