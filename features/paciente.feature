Feature: Paciente
  As Psicologo usuario do sistema
  I want to adicionar, mostrar, atualizar e remover pacientes
  So that eu possa manipular meus pacientes de forma simples

  Scenario: novo paciente
    Given O psicologo com crp '01/1234' existe
    And Eu estou logado na conta de crp '01/1234'
    And Eu estou na pagina de criacao de paciente
    When Eu preencho o campo de nome, cpf, telefone, email, endereco, historico de doencas, medicamentos, e o campo de selecao estado civil, quantidade de filhos, se eh fumante e ingere alcool, respectivamente, com 'Joao Pedro', '702.925.515-43', '(81)99999999', 'joao@gmail.com', 'Rua Amelia das Neves, 524', 'Nao tenho', 'Tbm nao tenho kkk', 'Solteiro', 0, 'Não', 'Sim'
    And Eu clico em criar paciente
    Then Eu vejo que o paciente com nome 'Joao Pedro' foi criado

  Scenario: remover paciente 
    Given O psicologo com crp '01/1234' existe
    And Eu estou logado na conta de crp '01/1234'
    And O paciente com nome, cpf, telefone, email, endereco, historico de doencas, medicamentos, estado civil, quantidade de filhos, fumante e se ingere alcool, respectivamente preenchidos com 'Joao Pedro', '702.925.515-43', '(81)99999999', 'joao@gmail.com', 'Rua Amelia das Neves, 524', 'Nao tenho', 'Tbm nao tenho kkk', 'Solteiro', 0, 'Não', 'Sim' existe
    And Eu estou na pagina de detalhes do paciente com nome 'Joao Pedro'
    When Eu clico em remover paciente
    Then Eu vejo que o paciente com nome 'Joao Pedro' foi corretamente deletado
    