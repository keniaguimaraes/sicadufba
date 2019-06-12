class ApplicationController < ActionController::Base
 # before_action :authenticate_user!
  

  add_breadcrumb "Página Principal", "/", :options => { :title => "Página principal" } 
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation,:curso_id,:tipoperfil_id, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  

 
  
end
