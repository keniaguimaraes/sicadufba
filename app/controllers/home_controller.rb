require "digest/sha2"
class HomeController < ApplicationController
 def index
    if user_signed_in? then
       user = Digest::SHA2.new << current_user.username+ENV['CHAVE']
       @usuarios = Usuario.where("username=:username",{username:user.to_s}).all
       if @usuarios.empty?  then
         @usuario_adiciona = Usuario.new
         @usuario_adiciona.username =  user.to_s
         @usuario_adiciona.tipoperfil_id = 1
         @usuario_adiciona.administrador = false
         @usuario_adiciona.bloqueio =  false
         @usuario_adiciona.curso_id = 1
         @usuario_adiciona.save
       end    
      
       @usuarios.each do |usuario|
        menssagem ="Informe o seu curso!"
        if usuario.curso_id == 1 and usuario.username != ENV['ADMINISTRADOR']then 
          redirect_to perfil_usuario_path(usuario), notice:menssagem   
        end
       end #end each      
    end          
 end
      
end
