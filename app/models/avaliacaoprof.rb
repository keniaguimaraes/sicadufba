class Avaliacaoprof < ApplicationRecord
  has_many :avaliacaotag
  belongs_to :user
  belongs_to :professor
  belongs_to :semestre
end
