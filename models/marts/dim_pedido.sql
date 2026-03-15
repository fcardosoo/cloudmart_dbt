select distinct

    id_pedido

from {{ ref('stg_vendas') }}