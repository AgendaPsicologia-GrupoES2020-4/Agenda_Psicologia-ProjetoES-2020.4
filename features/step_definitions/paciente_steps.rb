Given('O psicologo com crp {string} existe') do |string|
  visit '/psicologos/new?'
  
  fill_in 'psicologo[crp]', with: string
  fill_in 'psicologo[nome]', with: 'Julianne Sales'
  fill_in 'psicologo[password]', with: '123456'
  click_button 'criar'
end

And('Eu estou logado na conta de crp {string}') do |string| 
  visit '/login'
  fill_in 'crp', with: string
  fill_in 'password', with: '123456'
  click_button 'login'
end

And('Eu estou na pagina de criacao de paciente') do 
  visit '/psicologos/1/pacientes/new'
end

When('Eu preencho o campo de nome, cpf, telefone, email, endereco, historico de doencas, medicamentos, e o campo de selecao estado civil, quantidade de filhos, se eh fumante e ingere alcool, respectivamente, com {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {int}, {string}, {string}') do |string, string2, string3, string4, string5, string6, string7, string8, int, string9, string10|
  fill_in 'paciente[nome]', with: string
  fill_in 'paciente[cpf]', with: string2
  fill_in 'paciente[telefone]', with: string3
  fill_in 'paciente[email]', with: string4
  fill_in 'paciente[endereco]', with: string5
  fill_in 'paciente[historico_doencas]', with: string6
  fill_in 'paciente[medicamentos]', with: string7
  select string8, from: 'paciente[estado_civil]'
  fill_in 'paciente[quant_filhos]', with: int
  select string9, from: 'paciente[eh_fumante]'
  select string10, from: 'paciente[ingere_alcool]'
end

And('Eu clico em criar paciente') do
  click_button 'criar-paciente'
end

Then('Eu vejo que o paciente com nome {string} foi criado') do |string| 
  expect(page).to have_content(string)
end

And('O paciente com nome, cpf, telefone, email, endereco, historico de doencas, medicamentos, estado civil, quantidade de filhos, fumante e se ingere alcool, respectivamente preenchidos com {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {int}, {string}, {string} existe') do |string, string2, string3, string4, string5, string6, string7, string8, int, string9, string10|
  visit '/psicologos/1/pacientes/new'
  fill_in 'paciente[nome]', with: string
  fill_in 'paciente[cpf]', with: string2
  fill_in 'paciente[telefone]', with: string3
  fill_in 'paciente[email]', with: string4
  fill_in 'paciente[endereco]', with: string5
  fill_in 'paciente[historico_doencas]', with: string6
  fill_in 'paciente[medicamentos]', with: string7
  select string8, from: 'paciente[estado_civil]'
  fill_in 'paciente[quant_filhos]', with: int
  select string9, from: 'paciente[eh_fumante]'
  select string10, from: 'paciente[ingere_alcool]'
  click_button 'criar-paciente'
end

And('Eu vejo o paciente com nome {string} na listagem de pacientes') do |string| 
  expect(page).to have_content(string)  
end

When('Eu clico em remover o paciente de cpf {string}') do |string|
  click_link 'd-'+string
end

Then('Eu vejo que o paciente com nome {string} foi corretamente deletado') do |string|
  expect(page).to have_no_content(string)
end

Then('Eu vejo uma mensagem de erro na criacao do paciente') do 
  assert_selector('div#error_explanation', text: '')
end

And('Eu estou na pagina de listagem de pacientes') do 
  visit '/psicologos/1/pacientes/'
  expect(page).to have_current_path('/psicologos/1/pacientes/')
end

When('Eu clico em editar o paciente com cpf {string}') do |string|
  click_link 'e-'+string
end

And('Eu preencho o campo de telefone com {string}') do |string|
  fill_in 'paciente[telefone]', with: string
end

And('Eu clico em salvar') do 
  click_button 'criar-paciente'
end

Then('Eu vejo uma mensagem de erro na atualizacao do paciente') do 
  assert_selector('div#error_explanation', text: '')
end