select distinct

    id_vendedor

from {{ ref('int_vendas_enriquecidas') }}
where id_vendedor is not null