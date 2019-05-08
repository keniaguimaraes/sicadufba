json.extract! avaliacao, :id, :user_id, :professor_id, :itemavaliacao_id, :resp_positiva, :resp_negativa, :created_at, :updated_at
json.url avaliacao_url(avaliacao, format: :json)
