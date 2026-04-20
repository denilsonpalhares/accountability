# Pendências Concluídas (Arquivo Morto)

- [x] adicionar campo em centro de custo que permita a vinculação de um lançamento contábil a mais de um centro de custo.

- [x] eliminar o uso de credit e debit em entry_lines, de forma ao valor ser único e positivo e um campo defina se é debito ou credito.

- [x] Implementar registro no journal que permita que um lançamento feito com o objetivo de extornar ou corrigir outra mantenha um vínculo com o lançamento original.

- [x] Implementar campo em entry_lines que permita o registro de um lancamento originalmente em outra moeda, transformado em moeda local, mas salvando o valor original e a taxa de cambio utilizada.

- [x] Adicione enum com as moedas aceitas e ajuste o campo currency em entities para usar este enum.

- [x] criar arquivo com transacoes de teste para validar o sistema.

- [x] mudar entry_lines.amount para inteiro

- [x] mudar amount de entry lines para value.

- [x] normalizar tabela accounts no uso de quantity, due e cost center estarem embutidas.

- [x] normalizar relationships para que apenas exista se houver o relacionamento.

- [x] normalizar original_amount de forma a apenas existir se for um lançamento em moeda estrangeira.

- [x] Corrigir violação de normalização: padronizar quantias financeiras (amount) para integer nas tabelas relacionais auxiliares.

- [x] Limpeza do Enum mode_enum: substituição por atributos `is_required` lógicos dentro das tabelas filhas.

- [x] Adicionar restrições Unique (Índices unificados) nas tabelas join (journal_entry_relationships e entry_line_cost_centers) para evitar duplicação.

- [x] Geração das Migrations (Rails): Traduzir o esquema de `database_model.txt` (DBML) para arquivos de migração do ActiveRecord no Rails.

- [x] Criação dos Models (ActiveRecord): Implementação de 13 classes de modelo com associações, enums e validações básicas.
