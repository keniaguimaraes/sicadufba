json.extract! config_avaliacao, :id, :data_inicio, :data_fim, :created_at, :updated_at
json.url config_avaliacao_url(config_avaliacao, format: :json)
