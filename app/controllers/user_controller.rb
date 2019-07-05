class UserController < ApplicationController

  before_action :authenticate_user! 
  $home ="home"
  def index
     add_breadcrumb "Usuario", "/user", :title => "Voltar para a Página principal"
     @users = User.order(:email).paginate(:page => params[:page], :per_page => 4)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
     redirect_to "/user", notice: 'O Usuário foi criado com sucesso!' 
    else
      render :action => 'new'
    end
  end
  
  def bloquear 
     @user = User.find(params[:id])
    
        @user.update(bloqueio: true)
        menssagem= 'Usuário Bloqueado!'  
        redirect_to "/user", notice:menssagem
  end  
  
   def desbloquear 
     @user = User.find(params[:id])
    
        @user.update(bloqueio: false)
        menssagem= 'Usuário Desbloqueado!'  
        redirect_to "/user", notice:menssagem
   end  
  
  def edit
    @user = User.find(params[:id])
    add_breadcrumb "Usuários", "/user", :title => "Voltar para Anterior"
    add_breadcrumb "Editando Usuário" 
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/user",notice: 'O Usuário foi atualizado com sucesso!' 
    else
      render :action => 'edit'
    end
  end
  
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to "/user",notice: 'O Usuário foi deletado com sucesso.!' 
    end
  end
 
 private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

   
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
     params.require(:user).permit(:email,:username,:curso_id,:tipoperfil_id,:bloqueio, :administrador)
    end
   
end
