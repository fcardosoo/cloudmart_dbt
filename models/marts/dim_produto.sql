select distinct

    id_produto

from {{ ref('int_vendas_enriquecidas') }}
where id_produto is not null