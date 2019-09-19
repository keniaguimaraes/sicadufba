class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :notice => 'Você não é autorizado para acessar esse módulo!'
  end
  
  add_breadcrumb "Página Principal", "/", :options => { :title => "Página principal" } 

  def contact
  
  end

  def send_contact
    data = {}
    data['name'] = params[:name]
    data['email'] = params[:email]
    data['message'] = params[:message]

    ContactMailer.contact(data).deliver_now

    redirect_to root_path
  end
  
end
