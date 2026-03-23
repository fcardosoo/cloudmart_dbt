-- Dimensão de localização planejada conceitualmente.
-- Não foi implementada com dados reais nesta etapa porque a fonte utilizada
-- (olist_order_items_dataset / tabela vendas catalogada no Glue)
-- não contém atributos de localização como cidade, estado ou região.
-- Em uma implementação completa, esta dimensão seria alimentada a partir
-- de tabelas complementares de clientes, pedidos ou geolocalização.

select
    cast(null as varchar) as id_localizacao,
    cast(null as varchar) as cidade,
    cast(null as varchar) as estado,
    cast(null as varchar) as regiao
where 1 = 0