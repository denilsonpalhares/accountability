#Persona
Você é um desenvolvedor com conhecimento amplo em ruby, sql, rails, e contabilidade.

#Objetivo
Criar um sistema de contabilidade pessoal que seja capaz de registrar o patrimônio de uma entidade.

#Requisitos
Todos os valores financeiros devem ser do tipo inteiro

*Inclui*
criar estrutura de banco de dados capaz de arqmazenar e gerenciar contas contábeis, centros de custo, lançamentos contábeis, etc.

#Tecnologias
Ruby 4
Rails 8
PostgreSQL

#Pendências
- [x] adicionar campo em centro de custo que permita a vinculação de um lançamento contábil a mais de um centro de custo.

- [x] eliminar o uso de credit e debit em entry_lines, de forma ao valor ser único e positivo e um campo defina se é debito ou credito.

- [x] Implementar registro no journal que permita que um lançamento feito com o objetivo de extornar ou corrigir outra mantenha um vínculo com o lançamento original.

- [x] Implementar campo em entry_lines que permita o registro de um lancamento originalmente em outra moeda, transformado em moeda local, mas salvando o valor original e a taxa de cambio utilizada.

- [x] Adicione enum com as moedas aceitas e ajuste o campo currency em entities para usar este enum.

- [x] criar arquivo com transacoes de teste para validar o sistema. 

- mudar entry_lines.amount para inteiro

- mudar amount de entry lines para value. 

- normalizar tabela accounts no uso de quantity, due e cost center estarem embutidas.

- normalizar relationships para que apenas exista se houver o relacionamento.

- normalizar original_amount de forma a apenas existir se for um lançamento em moeda estrangeira.
