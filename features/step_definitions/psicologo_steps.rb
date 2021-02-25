Given('Eu estou na pagina de cadastrar novo psicologo') do
  visit "/psicologos/new?"
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
  expect(page).to have_current_path("/psicologos/" +  Psicologo.last.id.to_s + "/agenda")
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

And ('Eu estou na pagina de perfil do psicologo') do
  visit '/psicologos/1'
end

When ('Eu clico em editar psicologo') do
  click_link 'edit'
end

And ('Eu prencho o nome com {string}') do |nome|
  fill_in "nome", :with => nome
end

And ('Eu clico em atualizar') do
  click_button 'editar'
end

Then ('Eu vejo uma mensagem confirmando que o psicologo foi atualizado') do
  assert_selector('p#notice', text: '')
end

And ('Eu prencho a senha com {string}') do |senha|
  fill_in "password", :with => senha
end

When ('Eu clico em remover conta') do
  click_link 'delete'
end

Then ('Eu vejo que a conta com crp {string} e senha {string} nao existe mais para realizar o login') do |crp, senha| 
  visit '/login'

  fill_in 'crp', with: crp
  fill_in 'password', with: senha
  click_button 'login'

  assert_selector('p#alert', text: '')
end
