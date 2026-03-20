## Introdução 
Este teste demonstra a construção de um sistema de registro de Ordens de Serviço com base na IDE Delphi 12 e banco de dados Firebird 5 . O projeto foi desenvolvido e codificado entre os dias 06/03/2026 e 20/06/2026 por Francisco José Rosado dos Santos.
Para o desenvolvimento deste projeto não foram usados componentes de terceiros, apenas componentes nativos da versão 12 do Delphi. O componente de conexão com o banco escolhido foi o FireDAC. O domínio escolhido foi o de sistema de cadastro de ordens de serviço como o sugerido. A arquitetura das tabelas seguiu o sugerido sem alterações.

## Stack
  1. Versão da IDE Delphi: Delphi 12 Version 29.0.53982.0329;
  2. Versão do FireDAC: FireDAC290 - 29.0.53982.329;
  3. Versão do Firebird: Firebird 5.0.3-02 de 11 de Julho de 2025;
  
## Como configurar DB e conectar?
Para conectar a aplicação a base de dados, basta editar o arquivo **config.ini** que se encontra na pasta bin junto ao executável da aplicação. Estes são os parâmetros de conexão que se encontram neste arquivo:
  - driverid: Nome do driver da base para a conexão (Ex.: FB);
  - server: Caminho para o servidor de banco de dados (Ex.: 127.0.0.1);
  - port: Número da porta de conexão (Ex.: 3050);
  - database: Caminho físico da base de dados (Ex.: C:\teste\database\database.fdb);
  - username: Nome de usuário da base de dados (E.: SYSDBA);
  - password: Senha de conexão com a base (Ex.: masterkey);
Salve as alterações e rode a aplicação. O sistema valida a existência e preenchimento dos parâmetros presentes neste arquivo.

## Passos para executar
  1. Preencha o arquivo **config.ini**;
  2. Rode a aplicação;