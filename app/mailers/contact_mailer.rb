class ContactMailer < ApplicationMailer
  default from: 'contato@sicadufba.com'

  def contact data
    @name  = data['name']
    @email = data['email']
    @message = data['message']

    mail(to: 'keniiarruda@gmail.com', subject: 'Contato Sicad-UFBA')
  end
end
