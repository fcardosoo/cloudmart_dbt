{{ config(
    materialized='view'
) }}

with source as (

    select *
    from {{ source('bronze','vendas') }}

),

renamed as (

    select
        cast(order_id as varchar) as id_pedido,
        cast(order_item_id as integer) as item_pedido,
        cast(product_id as varchar) as id_produto,
        cast(seller_id as varchar) as id_vendedor,
        cast(shipping_limit_date as timestamp) as data_limite_envio,
        cast(price as numeric(10,2)) as preco_produto,
        cast(freight_value as numeric(10,2)) as valor_frete,
        cast(ano as integer) as ano,
        cast(mes as integer) as mes,
        cast(dia as integer) as dia
    from source

)

select *
from renamed