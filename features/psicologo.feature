Feature: Psicologo
  As a psicologo do AgendaPsicologia
  I want to criar uma conta, entrar e utilizar as rotas protegidas
  so that Eu nao tenho que fazer isso manualmente

  Scenario: Criar um novo psicologo
    Given Eu estou na pagina de cadastrar novo psicologo
    When Eu crio um psicologo com crp '1234567', nome 'itamar' e senha '12345678'
    And Eu clico em criar psicologo
    Then Eu vejo uma mensagem que o psicologo foi criado com sucesso

  Scenario: Criar um novo psicologo com o crp invalido
    Given Eu estou na pagina de cadastrar novo psicologo
    When Eu crio um psicologo com crp '123456', nome 'itamar' e senha '12345678'
    And Eu clico em criar psicologo
    Then Eu vejo uma mensagem de erro informando que o crp tem menos de sete caracteres

  Scenario: Criar um novo psicologo com o campo crp em branco
    Given Eu estou na pagina de cadastrar novo psicologo
    When Eu crio um psicologo com crp '', nome 'itamar' e senha '12345678'
    And Eu clico em criar psicologo
    Then Eu vejo uma mensagem de erro informando que o crp nao pode estar vazio

  Scenario: Criar um novo psicologo com o campo nome em branco
    Given Eu estou na pagina de cadastrar novo psicologo
    When Eu crio um psicologo com crp '1234567', nome '' e senha '12345678'
    And Eu clico em criar psicologo
    Then Eu vejo uma mensagem de erro informando que o nome nao pode estar vazio

  Scenario: Criar um novo psicologo com senha invalida
    Given Eu estou na pagina de cadastrar novo psicologo
    When Eu crio um psicologo com crp '1234567', nome 'itamar' e senha '12345'
    And Eu clico em criar psicologo
    Then Eu vejo uma mensagem de erro informando que a senha contem menos de seis caracteres