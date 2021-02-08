Given('Eu estou na pagina de cadastrar novo psicologo') do
  visit "psicologos/new?"
  expect(page).to have_current_path("/psicologos/new?")
end

When('Eu crio um psicologo com crp {string}, nome {string} e senha {string}') do |crp, nome, senha|
  fill_in "crp", :with => crp
  fill_in "nome", :with => nome
  fill_in "password", :with => senha
end

When('Eu clico em criar psicologo') do
  click_button "criar"
end

Then('Eu vejo uma mensagem que o psicologo foi criado com sucesso') do
  expect(page).to have_current_path("/agenda")
end

Then('Eu vejo uma mensagem de erro informando que o crp tem menos de sete caracteres') do
  assert_selector('div#error_explanation', text: '')
end

Then('Eu vejo uma mensagem de erro informando que o crp nao pode estar vazio') do
  assert_selector('div#error_explanation', text: '')
end

Then('Eu vejo uma mensagem de erro informando que o nome nao pode estar vazio') do
  assert_selector('div#error_explanation', text: '')
end

Then('Eu vejo uma mensagem de erro informando que a senha contem menos de seis caracteres') do
  assert_selector('div#error_explanation', text: '')
end