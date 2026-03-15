select

    id_pedido,
    id_produto,
    id_vendedor,
    data_limite_envio as data,

    preco_produto,
    valor_frete,

    preco_produto + valor_frete as valor_total_venda

from {{ ref('stg_vendas') }}