# Redshift Spectrum — Arquitetura Híbrida

## Objetivo

A arquitetura híbrida com Redshift Spectrum foi considerada neste projeto para permitir a consulta de dados históricos armazenados no Amazon S3 sem a necessidade de carregá-los fisicamente para o Amazon Redshift.

## Como funcionaria no cenário da TechNova Varejo

No contexto deste projeto, os dados mais recentes e de uso frequente permaneceriam modelados no Data Warehouse para consultas analíticas de alta performance. Já os dados históricos, armazenados nas camadas do Data Lake em formato Parquet e particionados no S3, poderiam ser consultados diretamente via Redshift Spectrum.

Essa abordagem permitiria:

- redução de custos com armazenamento no warehouse;
- manutenção de grandes volumes de histórico no S3;
- consultas híbridas combinando dados do Redshift com dados externos no Data Lake;
- escalabilidade analítica com separação entre dados quentes e dados frios.

## Exemplo conceitual de uso

Em uma implementação completa, o Redshift poderia criar um schema externo apontando para o Glue Data Catalog, permitindo consultas SQL sobre tabelas externas catalogadas a partir da camada Bronze/Silver no S3.

Exemplo conceitual:

```sql
create external schema spectrum_schema
from data catalog
database 'technova_db'
iam_role 'arn:aws:iam::<conta>:role/<role-redshift>'
create external database if not exists;