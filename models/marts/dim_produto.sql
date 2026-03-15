select distinct

    id_produto

from {{ ref('stg_vendas') }}