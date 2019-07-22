class Comentar < ApplicationRecord
    belongs_to :disciplinacurso
    belongs_to :professor
    belongs_to :semestre
    
    validates_presence_of :professor_id
    validates_presence_of :semestre_id
    validates_presence_of :disciplinacurso_id
end
