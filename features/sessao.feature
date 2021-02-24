Feature: Sessao
  As a psicologo do AgendaPsicologia
  I want to adicionar, mostrar, editar e remover sessoes
  so that eu possa manipular minhas secoes de forma simples

  Scenario: nova sessao
    Given O psicologo com crp '01/1234' existe
    And Eu estou logado na conta de crp '01/1234'
    And O paciente com nome, cpf, telefone, email, endereco, historico de doencas, medicamentos, estado civil, quantidade de filhos, fumante e se ingere alcool, respectivamente preenchidos com 'Joao Pedro', '702.925.515-43', '(81)99999999', 'joao@gmail.com', 'Rua Amelia das Neves, 524', 'Nao tenho', 'Tbm nao tenho kkk', 'Solteiro', 0, 'Não', 'Sim' existe
    And Eu estou na pagina de criacao de sessao
    When Eu preencho a data com '20', 'março' e '2021', a hora com '10' e '20' minutos e seleciono o paciente 'Joao Pedro'
    And Eu clico em criar sessao
    Then Eu vejo que a sessao com data '20/03/2021' as '10:20' e paciente 'Joao Pedro' foi criada
