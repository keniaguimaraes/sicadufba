class Avaliacaoprof < ApplicationRecord
  belongs_to :user
  belongs_to :professor
  belongs_to :semestre
end
