class Comentar < ApplicationRecord
    belongs_to :disciplinacurso
    belongs_to :professor
    belongs_to :semestre
end
