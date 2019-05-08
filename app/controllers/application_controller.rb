class ApplicationController < ActionController::Base
 # before_action :authenticate_user!
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation,:curso_id, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
  
  def crawl
     call_rake 'crawler:courses'
     respond_to do |format|
       format.html { redirect_to '/', notice: 'Done cursos' }
     end
  end
  
  def crawldisc
     call_rake 'crawler:disciplines'
     respond_to do |format|
       format.html { redirect_to '/', notice: 'Done disciplines' }
    end
  end
  
  def crawlprof
     call_rake 'crawler:professors'
     respond_to do |format|
       format.html { redirect_to '/', notice: 'Done professors' }
    end
  end
  
  def clear
      Disciplinacurso.destroy_all
      Disciplina.destroy_all
      Curso.destroy_all
      Professor.destroy_all
      respond_to do |format|
       format.html { redirect_to '/', notice: 'Done clear' }
      end 
  end      
  
  def call_rake(task, options = {})
      options[:rails_env] ||= Rails.env
      args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
      system "rake #{task} #{args.join(' ')} >> #{Rails.root}/log/rake.log 2>&1 &"
  end
  
 
  
end
