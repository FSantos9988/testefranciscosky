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
  
## Lista de requisitos atendidos/implementados
  [X] = IMPLEMENTADO/ATENDIDO    [] = NÃO IMPLEMENTADO/ATENDIDO
  
  - Criação das Entidades:
    [X] Cliente;
	[X] OrdemServico;
	[X] ItemOrdem;
	[] StatusLog;
  - CRUD Completo:
    [X] Incluir / Editar / Excluir / Listar para Cliente e 
    Ordem de Serviço (itens incluídos na mesma tela ou em aba / grid filho);
	[X] Recalcular ValorTotal da OS (soma de itens) automaticamente;
	:
    [X] Filtro multi-critério: por intervalo de datas (abertura), Status, Cliente (nome
    parte), ValorTotal (>= / <= opcional);
	[] Paginação ou pelo menos limitação configurável (ex.: TOP/N FIRST) ou lazy
    load se implementado (opcional);
	
  - Relatório:
    [X] Relatório de Ordens de Serviço filtrável pelos mesmos campos acima;
	   -> Deve conter: total de OS por status, soma de valores (agrupamentos);
	[X] Exportar para PDF ou Excel / CSV (ou ambos). Se não suportar diretamente no
    componente, justificar;
	
  - Funcionalidade NÃO-CRUD (Obrigatória – escolha a implementação principal)
    Implementar obrigatoriamente: Cálculo de SLA / Atraso:
    [] SLA: considerar DataPrevista. Se DataAtual > DataPrevista e Status não for
    Concluída/Cancelada → OS em atraso;
    [X] Mostrar destaque visual (cor / ícone) nas OS atrasadas COR!!!;
    [X] Exibir contador (dashboard simples) no topo: Total Abertas, Em Andamento,
    Concluídas, Em Atraso;
	
  - Funcionalidades Opcionais (Escolher 0 a 2 – valem bônus):
    [] (A) Histórico/Auditoria de Status (tabela StatusLog com DataHora, StatusAnterior,
    StatusNovo, UsuarioSimulado);
    [X] (B) Exportação e Importação de Clientes via CSV (com validação e relatório de erros);
	Obs.: Optou-se por importar e exportar em .XLS(X) por se tratar de uma estrutura mais robusta de arquivos;
	[] (C) Job Simulado: botão “Processar Atrasos” que recalcula campo DiasAtraso e atualiza;
    indicador (transação explícita);
	[] (D) Mini Dashboard Gráfico (se usar Delphi 10.x) com barras por Status;
	[] (E) Notas Técnicas com Rich Text / HTML gravadas em tabela associada;
	
  - Extras (Se quiser ir além sem custo alto):
    [] Barra de progresso ao gerar relatório grande;
    [X] Atalhos de teclado (F2 editar, INS novo, DEL excluir);
	[] Validação de campos obrigatórios com destaque visual;