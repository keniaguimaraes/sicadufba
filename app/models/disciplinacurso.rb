class Disciplinacurso < ApplicationRecord
  belongs_to :disciplina
  belongs_to :curso
  has_many :comentarios
   has_many :comentar 
end
