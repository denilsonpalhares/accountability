# Plano do Projeto de Contabilidade

## O que já foi feito

O design inicial da base de dados e a sua modelagem já foram concluídos e validados conceitualmente. As seguintes tarefas foram finalizadas:

1. **Modelagem de Entidades e Contas:** 
   - Criação da estrutura de `entities` (PF/PJ), `cost_centers` (com hierarquia) e `accounts` (plano de contas com hierarquia).
   - Normalização das configurações de contas separando regras de quantidade (`account_quantity_settings`), vencimento (`account_due_settings`) e centro de custo (`account_cost_center_settings`).

2. **Modelagem de Lançamentos Contábeis (Journal Entries):**
   - Criação de `journal_entries` com status (DRAFT/POSTED) e tabela de relacionamentos (`journal_entry_relationships`) para vincular estornos/reclassificações.
   - Refatoração de `entry_lines` para utilizar um único valor inteiro positivo (`value`) aliado a um enumerador de natureza (`nature` = DEBIT/CREDIT).

3. **Suporte a Multi-moeda e Rateio de Centros de Custo:**
   - Implementação de enum de moedas aceitas e suporte nativo na entidade.
   - Tabela `entry_line_currencies` para registrar lançamentos realizados em moeda estrangeira convertidos para moeda local.
   - Tabela `entry_line_cost_centers` permitindo a vinculação e rateio de uma mesma linha de lançamento em múltiplos centros de custo.

4. **Padronização e Integridade de Dados:**
   - Todos os valores financeiros definidos como tipo Inteiro (centavos) para evitar erros de ponto flutuante.
   - Adição de índices únicos (Unique constraints) em tabelas de relacionamento para evitar duplicações de registros.

5. **Testes de Validação Conceitual:**
   - Criação do script `test_transactions.rb` contendo cenários de simulação de entidades, contas e múltiplos lançamentos do dia-a-dia.

## Próximos Passos

Como o objetivo é desenvolver um sistema utilizando **Ruby on Rails 8** e **PostgreSQL**, os próximos passos devem focar em traduzir o modelo teórico para o ecossistema Rails e implementar a lógica de negócio:

- [ ] **1. Geração das Migrations (Rails):**
  - Traduzir o esquema de `database_model.txt` (DBML) para arquivos de migração do ActiveRecord no Rails.
  - Configurar as chaves estrangeiras, índices e constraints de banco de dados (ex: UUIDs, *null constraints*).

- [ ] **2. Criação dos Models (ActiveRecord):**
  - Criar as classes de modelo (Entity, CostCenter, Account, JournalEntry, EntryLine, etc.).
  - Configurar os relacionamentos (`has_many`, `belongs_to`, `has_one`).
  - Implementar os `enums` definidos (nature, account_type, journal_status, etc.).

- [ ] **3. Validações de Negócio (Business Logic):**
  - Validar a regra das Partidas Dobradas: Garantir que em cada `JournalEntry` a soma dos débitos seja igual à soma dos créditos.
  - Implementar validações dinâmicas nas `EntryLines` com base nas configurações da conta (ex: se `cost_center_mode` for obrigatório, impedir salvar sem registro em `entry_line_cost_centers`).
  - Impedir a alteração ou exclusão de lançamentos que estejam com status `POSTED` (permitindo apenas estorno/reclassificação vinculada).

- [ ] **4. Refatoração do Script de Testes (Seed):**
  - Adaptar o arquivo `test_transactions.rb` para rodar como o `db/seeds.rb` do Rails.
  - Validar se os relacionamentos e validações do banco de dados salvam corretamente as operações de teste.

- [ ] **5. Interface e Controladores (APIs / Views):**
  - Desenvolver as rotas e controllers básicos para criação de Lançamentos (Journal Entries), visualização de relatórios/balancetes (Trial Balance/Ledger).
