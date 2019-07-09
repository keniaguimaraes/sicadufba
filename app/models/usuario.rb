class Usuario < ApplicationRecord
    belongs_to:curso
    belongs_to:tipoperfil
   
   # has_many :comentars
   # has_many :avaliacaoprofs
end
