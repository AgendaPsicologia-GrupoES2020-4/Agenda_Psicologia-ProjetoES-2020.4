json.extract! sessao, :id, :data, :hora, :paciente_id, :created_at, :updated_at
json.url sessao_url(sessao, format: :json)
