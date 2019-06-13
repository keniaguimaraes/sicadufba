class Semestre < ApplicationRecord
    has_many :comentarios
    has_many :comentar 
    has_many :avaliacaoprof
    has_many :resultado
end
