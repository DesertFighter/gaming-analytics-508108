with source as (

    select *
    from {{ source('gaming_landing', 'devices') }}

),

renamed as (

    select
        deviceid,
        advertisingid,
        devicetype,
        manufacturer,
        devicemodel,
        operatingsystem,
        osversion,
        appversion,
        screenresolution,
        networktype,
        carriername,
        devicelanguage,
        istablet,
        isemulator,
        platformcode,
        inserted_at,
        updated_at,
        source_name

    from source

)

select * from renamed