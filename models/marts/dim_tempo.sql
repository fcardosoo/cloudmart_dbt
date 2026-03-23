select distinct

    data_limite_envio as data,
    ano,
    mes,
    dia,

    extract(year from data_limite_envio) as ano_data,
    extract(month from data_limite_envio) as mes_data,
    extract(day from data_limite_envio) as dia_data,
    extract(week from data_limite_envio) as semana_ano

from {{ ref('int_vendas_enriquecidas') }}
where data_limite_envio is not null