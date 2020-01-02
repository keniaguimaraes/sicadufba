class UsuariosController < ApplicationController
   before_action :authenticate_user!
   load_and_authorize_resource
   skip_authorize_resource :only => :perfil
    
  def index
     add_breadcrumb "Usuario", "/usuarios", :title => "Voltar para a Página principal"
     @usuarios = Usuario.order(:username).paginate(:page => params[:page], :per_page => 4)
  end
  
  def new
    @usuario = Usuario.new
  end
  
  def create
    @usuario = Usuario.new(params[:user])
    if @usuario.save
     redirect_to "/usuarios", notice: 'O Usuário foi criado com sucesso!' 
    else
      render :action => 'new'
    end
  end
  
  def bloquear 
     @usuario = Usuario.find(params[:id])
    
        @usuario.update(bloqueio: true)
        menssagem= 'Usuário Bloqueado!'  
        redirect_to "/usuarios", notice:menssagem
  end  
  
   def desbloquear 
        @usuario = Usuario.find(params[:id])
    
        @usuario.update(bloqueio: false)
        menssagem= 'Usuário Desbloqueado!'  
        redirect_to "/usuarios", notice:menssagem
   end  
  
  def edit
    
    @usuario = Usuario.find(params[:id])

    
    curso_id = @usuario.curso_id   
    
    @curso = Curso.where(" id = :curso",{curso:curso_id}).all
    
    add_breadcrumb "Usuários", "/usuarios", :title => "Voltar para Anterior"
    add_breadcrumb "Editando Usuário" 
  end
  
  def perfil
    @usuario = Usuario.find(params[:id])
     # curso_id=0
   # @usuario.each do |usuario| 
       curso_id = @usuario.curso_id   
   # end
    @curso = Curso.where(" id = :curso",{curso:curso_id}).all
    
    add_breadcrumb "Meu perfil", "/", :title => "Voltar para Anterior" 
  end
  
  
  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update(usuario_params)
      redirect_to "/",notice: 'O Usuário foi atualizado com sucesso!' 
    else
      render :action => 'edit'
    end
  end
  
  
  def destroy
    @usuario = Usuario.find(params[:id])
    if @usuario.destroy
      redirect_to "/usuarios",notice: 'O Usuário foi deletado com sucesso.!' 
    end
  end
 
 private

    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

   
    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
     params.require(:usuarios).permit(:username,:curso_id,:tipoperfil_id,:bloqueio,:administrador)
    end
   
end


