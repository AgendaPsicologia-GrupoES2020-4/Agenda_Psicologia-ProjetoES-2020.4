json.extract! paciente, :id, :nome, :cpf, :telefone, :email, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
