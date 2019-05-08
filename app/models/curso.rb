class Curso < ApplicationRecord
    has_many :disciplinacursos
    has_many :users
end
