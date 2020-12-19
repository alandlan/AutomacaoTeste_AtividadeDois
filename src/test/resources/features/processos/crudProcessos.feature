# language: pt

@wip
Funcionalidade: CRUD de processos


  Contexto:
    Dado O usuario esta na pagina de processos
    E o usuário informar "vara" com o valor igual a "delete2"
    E o usuário informar "numero_processo" com o valor igual a "63984589"
    E o usuário informar "natureza" com o valor igual a "Criminal"
    E o usuário informar "partes" com o valor igual a "AndersonXAllan"
    E o usuário informar "urgente" com o valor igual a "N"
    E o usuário informar "arbitramento" com o valor igual a "S"
    E o usuário informar "assistente_social" com o valor igual a "Tiago Volpi"
    E o usuário informar "data_entrada" com o valor igual a "20-12-2020"
    E o usuário informar "data_saida" com o valor igual a "21-01-2021"
    E o usuário informar "data_agendamento" com o valor igual a "16-12-2020"
    E o usuário informar "status" com o valor igual a "Aguardando"
    E o usuário informar "observacao" com o valor igual a "SP Campeao Copa do Brasil 2021"

  Cenário: Inserir um novo processo - POST
    Quando o usuário clicar no botão salvar
    Então o usuário deveria ver a mensagem "salvo com sucesso"

  Cenario: Obter Processo - GET
    Dado  que o usuário gostaria de obter processo por Id
    Quando o usuário clicar no botão mostrar
    Então o usuário deveria vizualizar o processo

  Cenario: Mostrar um usuário já criado - PUT
    E o usuário clicar no botão salvar
    Quando alterar o campo "vara" para o valor "morumbi"
    E o usuario clicar em editar
    Então o usuário deveria ver a mensagem "sucesso"
    Quando o usuário clicar em mostrar
    Entao o usuario visualiza o campo "vara" com o valor "morumbi"
    E o usuario visualiza o campo "numero_processo" com o valor "63984589"
    E o usuario visualiza o campo "natureza" com o valor "Criminal"
    E o usuario visualiza o campo "partes" com o valor "AndersonXAllan"
    E o usuario visualiza o campo "urgente" com o valor "N"
    E o usuario visualiza o campo "arbitramento" com o valor "S"
    E o usuario visualiza o campo "assistente_social" com o valor "Tiago Volpi"
    E o usuario visualiza o campo "data_entrada" com o valor "20-12-2020"
    E o usuario visualiza o campo "data_saida" com o valor "21-01-2021"
    E o usuario visualiza o campo "data_agendamento" com o valor "16-12-2020"
    E o usuario visualiza o campo "status" com o valor "Aguardando"
    E o usuario visualiza o campo "observacao" com o valor "SP Campeao Copa do Brasil 2021"

  Cenario: Mostrar um usuário já criado - DELETE
    E o usuário clicar no botão salvar
    Quando o usuário clicar em deletar
    Então o usuário deveria ver a mensagem "sem conteúdo"
    Quando o usuário clicar em mostrar
    Entao o usuário deveria ver a mensagem "não encontrado"

  Esquema do Cenario: Validacao de POST
    Dado O usuario esta na pagina de processos
    E o usuário informar "vara" com o valor igual a "teste"
    E o usuário informar "numero_processo" com o valor igual a "63984589"
    E o usuário informar "natureza" com o valor igual a "Criminal"
    E o usuário informar "partes" com o valor igual a "AndersonXAllan"
    E o usuário informar "urgente" com o valor igual a "N"
    E o usuário informar "arbitramento" com o valor igual a "S"
    E o usuário informar "assistente_social" com o valor igual a "Tiago Volpi"
    E o usuário informar "data_entrada" com o valor igual a "<entrada>"
    E o usuário informar "data_saida" com o valor igual a "20/12/2020"
    E o usuário informar "data_agendamento" com o valor igual a "16-12-2020"
    E o usuário informar "status" com o valor igual a "Aguardando"
    E o usuário informar "observacao" com o valor igual a "SP Campeao Copa do Brasil 2021"
    Quando o usuário clicar no botão salvar
    Então o usuário deveria ver a status "<statusCode>"

    Exemplos:
      | entrada     | statusCode |
      | 20/12/2020  | 201        |
      | 123         | 422        |
      | 20/12/2020  | 201        |

