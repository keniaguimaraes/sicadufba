class ApplicationController < ActionController::Base
 # before_action :authenticate_user!
  

  add_breadcrumb "Página Principal", "/", :options => { :title => "Página principal" } 
=begin
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation,:curso_id,:tipoperfil_id,:bloqueio,:administrador, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
=end  
  def contact
     add_breadcrumb "Contato"
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
