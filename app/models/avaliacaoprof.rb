class Avaliacaoprof < ApplicationRecord
  belongs_to :professor
  belongs_to :semestre
  belongs_to :disciplinacurso
  
  validates_presence_of :professor_id
  validates_presence_of :semestre_id
  validates_presence_of :disciplinacurso_id
end
