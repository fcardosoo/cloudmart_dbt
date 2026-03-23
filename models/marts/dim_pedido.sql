select distinct

    id_pedido,
    data_limite_envio as data_pedido,
    ano,
    mes,
    dia

from {{ ref('int_vendas_enriquecidas') }}
where id_pedido is not null