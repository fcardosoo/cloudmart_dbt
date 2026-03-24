# Modelo Dimensional — TechNova Varejo

## Visão Geral

Para a camada analítica do projeto **Modern Data Lakehouse na AWS** da empresa fictícia **TechNova Varejo**, foi adotada a abordagem de **modelagem dimensional no formato Star Schema**, conforme os princípios de Kimball.

Nesse modelo, a tabela fato concentra as métricas quantitativas do processo de negócio, enquanto as dimensões armazenam os contextos analíticos necessários para filtragem, segmentação e interpretação dos indicadores.

A escolha do **Star Schema** se justifica por sua simplicidade, alta legibilidade para consumo analítico e boa aderência a cenários de Business Intelligence e Data Warehouse.

---

## Tabela Fato

### `fato_vendas`

A tabela `fato_vendas` representa o nível transacional de itens de pedido, sendo o centro do modelo dimensional.

### Métricas principais:
- `preco_produto`
- `valor_frete`
- `valor_total_venda`

### Chaves e atributos analíticos:
- `id_pedido`
- `item_pedido`
- `id_produto`
- `id_vendedor`
- `data`
- `ano`
- `mes`
- `dia`
- `faixa_frete`
- `faixa_preco`

A granularidade da tabela fato é **um item por pedido**, permitindo análises detalhadas sobre vendas, frete e composição do valor total.

---

## Dimensões

### `dim_tempo`

A dimensão de tempo foi criada para permitir análises temporais e evolução histórica dos dados.

### Atributos:
- `data`
- `ano`
- `mes`
- `dia`
- `ano_data`
- `mes_data`
- `dia_data`
- `semana_ano`

### Justificativa:
Essa dimensão é essencial para análises por período, sazonalidade, acompanhamento mensal e recortes por calendário.

---

### `dim_produto`

A dimensão de produto representa os itens comercializados.

### Atributos:
- `id_produto`

### Justificativa:
Mesmo com estrutura simples, essa dimensão permite separar a entidade produto da tabela fato e prepara o modelo para futura expansão com atributos adicionais, como nome, categoria e marca, caso novas fontes sejam integradas.

---

### `dim_vendedor`

A dimensão de vendedor representa o vendedor associado ao item vendido.

### Atributos:
- `id_vendedor`

### Justificativa:
Permite análises de desempenho por vendedor e segmentações relacionadas à operação comercial.

---

### `dim_pedido`

A dimensão de pedido representa o contexto transacional do pedido.

### Atributos:
- `id_pedido`
- `data_pedido`
- `ano`
- `mes`
- `dia`

### Justificativa:
Essa dimensão possibilita agrupar e analisar dados no nível do pedido, servindo como referência transacional para a fato.

---

### `dim_localizacao`

A dimensão de localização foi prevista no modelo lógico por sua relevância analítica em cenários de vendas.

### Estrutura planejada:
- `id_localizacao`
- `cidade`
- `estado`
- `regiao`

### Justificativa:
A dimensão foi mantida de forma **conceitual**, pois a fonte de dados utilizada nesta implementação (`olist_order_items_dataset`, catalogada como `vendas`) não contém atributos geográficos como cidade, estado ou região.

Em uma implementação completa, essa dimensão seria alimentada por fontes complementares, como tabelas de clientes, pedidos ou geolocalização.

---

## Relacionamento lógico do modelo

O modelo segue a estrutura de estrela, em que a tabela `fato_vendas` se relaciona com as dimensões analíticas.

Representação conceitual:

```text
dim_tempo --------\
dim_produto ------ \
dim_vendedor -----  \
dim_pedido -------   --> fato_vendas
dim_localizacao --  /