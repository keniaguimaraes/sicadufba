class Avaliacao < ApplicationRecord
    belongs_to :user_id
    belongs_to :professor
    belongs_to :itemavaliacao
end
