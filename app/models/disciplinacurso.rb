class Disciplinacurso < ApplicationRecord
  belongs_to :disciplina
  belongs_to :curso
  has_many :comentar 
  has_many :avaliacaoprof  
end
