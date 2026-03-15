select distinct

    data_limite_envio as data,
    extract(year from data_limite_envio) as ano,
    extract(month from data_limite_envio) as mes,
    extract(day from data_limite_envio) as dia

from {{ ref('stg_vendas') }}