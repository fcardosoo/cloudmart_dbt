
{{ config(
    materialized='view'
) }}


with base as (

    select *
    from {{ ref('stg_vendas') }}

),

enriched as (

    select
        id_pedido,
        item_pedido,
        id_produto,
        id_vendedor,
        data_limite_envio,
        ano,
        mes,
        dia,
        preco_produto,
        valor_frete,
        preco_produto + valor_frete as valor_total_venda,

        case
            when valor_frete = 0 then 'frete_gratis'
            when valor_frete <= 20 then 'frete_baixo'
            when valor_frete <= 50 then 'frete_medio'
            else 'frete_alto'
        end as faixa_frete,

        case
            when preco_produto < 50 then 'baixo_valor'
            when preco_produto < 200 then 'medio_valor'
            else 'alto_valor'
        end as faixa_preco

    from base

)

select *
from enriched