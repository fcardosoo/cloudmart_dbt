with source as (

    select *
    from {{ source('ecommerce_raw','olist_order_items_dataset') }}

),

renamed as (

    select

        order_id as id_pedido,
        order_item_id as item_pedido,
        product_id as id_produto,
        seller_id as id_vendedor,
        shipping_limit_date as data_limite_envio,
        price as preco_produto,
        freight_value as valor_frete

    from source

)

select *
from renamed