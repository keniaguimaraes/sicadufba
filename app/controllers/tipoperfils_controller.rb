
class TipoperfilsController < ApplicationController
  before_action :set_tipoperfil, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource  
  # GET /tipoperfils
  # GET /tipoperfils.json
  def index
    add_breadcrumb "Perfil", tipoperfils_path, :title => "Voltar para a Página principal"
    @tipoperfils = Tipoperfil.all
  end

  # GET /tipoperfils/1
  # GET /tipoperfils/1.json
  def show
  end

  # GET /tipoperfils/new
  def new
    @tipoperfil = Tipoperfil.new
    
    add_breadcrumb "Perfil", tipoperfils_path, :title => "Voltar para Anterior"
    add_breadcrumb "Inserir Tipo Perfil" 
  end

  # GET /tipoperfils/1/edit
  def edit
    
    add_breadcrumb "Perfil", tipoperfils_path, :title => "Voltar para Anterior"
    add_breadcrumb "Editando Perfil" 
  end

  # POST /tipoperfils
  # POST /tipoperfils.json
  def create
    @tipoperfil = Tipoperfil.new(tipoperfil_params)

    respond_to do |format|
      if @tipoperfil.save
        format.html { redirect_to @tipoperfil, notice: 'Tipoperfil was successfully created.' }
        #format.json { render :show, status: :created, location: @tipoperfil }
      else
        format.html { render :new }
        format.json { render json: @tipoperfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipoperfils/1
  # PATCH/PUT /tipoperfils/1.json
  def update
    respond_to do |format|
      if @tipoperfil.update(tipoperfil_params)
        format.html { redirect_to @tipoperfil, notice: 'Tipoperfil was successfully updated.' }
       # format.json { render :show, status: :ok, location: @tipoperfil }
      else
        format.html { render :edit }
        format.json { render json: @tipoperfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipoperfils/1
  # DELETE /tipoperfils/1.json
  def destroy
    @tipoperfil.destroy
    respond_to do |format|
      format.html { redirect_to tipoperfils_url, notice: 'Tipoperfil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipoperfil
      @tipoperfil = Tipoperfil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipoperfil_params
      params.require(:tipoperfil).permit(:perfil)
    end
end
