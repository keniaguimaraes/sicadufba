class ApplicationController < ActionController::Base
 # before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :notice => 'Você não é autorizado para acessar esse módulo!'
  end
  
  add_breadcrumb "Página Principal", "/", :options => { :title => "Página principal" } 

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [:username, :administrador]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

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
