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
  visit '/pacientes/new'
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
  select int, from: 'paciente[quant_filhos]'
  select string9, from: 'paciente[eh_fumante]'
  select string10, from: 'paciente[ingere_alcool]'
end

And('Eu clico em criar paciente') do
  click_button 'criar-paciente'
end

Then('Eu vejo que o paciente com nome {string} foi criado') do |string| 
  expect(page).to have_content(string)
  expect(page).to have_current_path(pacientes_path + '/' + Paciente.last.id.to_s)
end