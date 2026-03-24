{{ config(
    materialized='incremental',
    unique_key='id_pedido',
    sort='data',
    dist='id_produto'
) }}

select

    id_pedido,
    item_pedido,
    id_produto,
    id_vendedor,
    data_limite_envio as data,
    ano,
    mes,
    dia,
    preco_produto,
    valor_frete,
    valor_total_venda,
    faixa_frete,
    faixa_preco

from {{ ref('int_vendas_enriquecidas') }}

{% if is_incremental() %}
where data_limite_envio > (select max(data) from {{ this }})
{% endif %}