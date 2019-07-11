class HomeController < ApplicationController
 def index
    if user_signed_in? then
       @usuarios = Usuario.where("username=:username",{username:current_user.username}).all
       if @usuarios.empty?  then
         @usuario_adiciona = Usuario.new
         @usuario_adiciona.username = current_user.username
         @usuario_adiciona.user_id = current_user.id
         @usuario_adiciona.tipoperfil_id = 1
         @usuario_adiciona.administrador = false
         @usuario_adiciona.bloqueio =  false
         @usuario_adiciona.curso_id = 1
         @usuario_adiciona.save
       end    
      
       @usuarios.each do |usuario|
        menssagem="Informe o seu curso"
        if usuario.curso_id == 1 and usuario.username != 'kenia.arruda'then 
          redirect_to perfil_usuario_path(usuario), notice:menssagem   
        end
       end #end each      
    end          
 end
      
end
