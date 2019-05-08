class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
  #:cas_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :avaliacaos 
  has_many :comentario
  has_many :comentar 
  belongs_to:curso
         
end
