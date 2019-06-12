json.extract! user, :id, :username,:email, :curso_id,:admin_reserva,:tipoperfil_id, :administrador,:password, :created_at, :updated_at
json.url o_url(user, format: :json)