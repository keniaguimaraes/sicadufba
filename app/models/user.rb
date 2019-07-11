class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   
  devise:cas_authenticatable
  
  # devise :database_authenticatable, :registerable, 
  #:recoverable, :rememberable, :validatable
   # devise :cas_authenticatable, :registerable,
   #      :recoverable, :rememberable, :validatable
         
  #has_many :avaliacaos 
 # has_many :comentario
  #has_many :comentar
 # has_many :avaliacaoprof
  #belongs_to:tipoperfil
  #belongs_to:curso
  
=begin  
  validates :email, length: {minimum: 10, message: 'Deve ter Pelo Menos 10 Caracteres'}
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  } # etc.
  
  validate :validate_username

  def validate_username
   if User.where(email: username).exists?
    errors.add(:username, :invalid)
   end
  end
=end  
 def cas_extra_attributes=(extra_attributes)
    extra_attributes.each do |name, value|
      case adm.to_sym
      when :administrador
        self.administrador = value
      end
    end
  end
   
end
