class Professor < ApplicationRecord
    has_many :avaliacaos
    has_many :comentarios
    has_many :comentar 
    has_many :avaliacaoprof
end
