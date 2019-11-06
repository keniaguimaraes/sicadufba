class ConfigAvaliacaosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restricao, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource  

  # GET /config_avaliacaos
  # GET /config_avaliacaos.json
  def index
    @config_avaliacaos = ConfigAvaliacao.all
    add_breadcrumb "Config. Avaliaçao", config_avaliacaos_path, :title => "Voltar para a Página principal"

  end

  # GET /config_avaliacaos/1
  # GET /config_avaliacaos/1.json
  def show
  end

  # GET /config_avaliacaos/news
  def new
    @config_avaliacao = ConfigAvaliacao.new

    add_breadcrumb "Config. Avaliaçao", "/config_avaliacaos", :title => "Voltar para a Anterior"
    add_breadcrumb "Incluir Config. Avaliaçao"
  end

  # GET /config_avaliacaos/1/edit
  def edit
     add_breadcrumb "Config. Avaliaçao", "/config_avaliacaos", :title => "Voltar para a Anterior"
     add_breadcrumb "Editando Config. Avaliaçao" 
  end

  # POST /config_avaliacaos
  # POST /config_avaliacaos.json
  def create
    @config_avaliacao = ConfigAvaliacao.new(config_avaliacao_params)

    respond_to do |format|
      if @config_avaliacao.save
        format.html { redirect_to config_avaliacaos_path, notice: 'Configuração criada com sucesso.' }
        #format.json { redirect_to @config_avaliacao }
      else
        format.html { render :new }
        format.json { render json: @config_avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_avaliacaos/1
  # PATCH/PUT /config_avaliacaos/1.json
  def update
    respond_to do |format|
      if @config_avaliacao.update(config_avaliacao_params)
        format.html { redirect_to config_avaliacaos_path, notice: 'Configuração editada com sucesso.' }
        #format.json {redirect_to @config_avaliacao }
      else
        format.html { render :edit }
        format.json { render json: @config_avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_avaliacaos/1
  # DELETE /config_avaliacaos/1.json
  def destroy
    @config_avaliacao.destroy
    respond_to do |format|
      format.html { redirect_to config_avaliacaos_url, notice: 'Config avaliacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_avaliacao
      @config_avaliacao = ConfigAvaliacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_avaliacao_params
      params.require(:config_avaliacao).permit(:data_inicio, :data_fim)
    end
end
