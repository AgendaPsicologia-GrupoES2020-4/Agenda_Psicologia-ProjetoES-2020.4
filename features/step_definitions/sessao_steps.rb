And ('Eu estou na pagina de criacao de sessao') do 
  visit '/psicologos/1/sessaos/new'
end

When ('Eu preencho a data com {string}, {string} e {string}, a hora com {string} e {string} minutos e seleciono o paciente {string}') do |dia, mes, ano, hora, minutos, paciente|
  select dia, from: 'sessao_data_3i'
  select mes, from: 'sessao_data_2i'
  select ano, from: 'sessao_data_1i'
  select hora, from: 'sessao_hora_4i'
  select minutos, from: 'sessao_hora_5i'
  select paciente, from: 'sessao_paciente_id'
end

And ('Eu clico em criar sessao') do
  click_button 'cadastrar-sessao'
end

Then ('Eu vejo que a sessao com data {string} as {string} e paciente {string} foi criada') do |data, hora, paciente|
  expect(page).to have_content(data)
  expect(page).to have_content(hora)
  expect(page).to have_content(paciente)
end

And ('A sessao de data preenchida com {string}, {string} e {string}, a hora com {string} e {string} minutos e o paciente {string} existe') do |dia, mes, ano, hora, minutos, paciente|
  visit '/psicologos/1/sessaos/new'
  select dia, from: 'sessao_data_3i'
  select mes, from: 'sessao_data_2i'
  select ano, from: 'sessao_data_1i'
  select hora, from: 'sessao_hora_4i'
  select minutos, from: 'sessao_hora_5i'
  select paciente, from: 'sessao_paciente_id'
  click_button 'cadastrar-sessao'
end

And ('Eu estou na pagina de detalhes da sessao') do
  visit '/psicologos/1/sessaos/1'
end

When ('Eu clico em remover') do
  click_link 'delete'
end

Then ('Eu vejo uma mensagem informando que a sessao foi corretamente deletada') do 
  assert_selector('p#notice', text: '')
end

When ('Eu clico em editar') do
  click_link 'edit'  
end

And ('Eu altero a hora para {string}') do |hora| 
  select hora, from: 'sessao_hora_4i'
end

And ('Eu clico em cadastrar') do
  click_button 'cadastrar-sessao'
end

Then ('Eu vejo uma mensagem informando que a sessao foi corretamente atualizada') do
  assert_selector('p#notice', text: '')
end

Then ('Eu vejo uma mensagem de erro no cadastro da sessao') do
  assert_selector('div#error_explanation', text: '')
end
