{{ config(alias='stg_test_table') }}
with source as (
      select * from {{ source('raw_test', 'test_table') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("name") }},
        {{ adapter.quote("age") }},
        {{ adapter.quote("sex") }}
    from source
)
select * from renamed
