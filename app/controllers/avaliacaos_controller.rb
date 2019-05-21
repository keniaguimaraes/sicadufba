class AvaliacaosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_avaliacao, only: [:show, :edit, :update, :destroy]

  # GET /avaliacaos
  # GET /avaliacaos.json
  def index
    @avaliacaos = Avaliacao.where("user_id =:user_id",{user_id:current_user.id}).all
                           .paginate(:page => params[:page], :per_page => 7)
  end

  # GET /avaliacaos/1
  # GET /avaliacaos/1.json
  def show
  end

  # GET /avaliacaos/new
  def new
    @avaliacao = Avaliacao.new
    @itemavaliacao = Itemavaliacao.all
    @professor = Professor.all.order("nome")
  end

  # GET /avaliacaos/1/edit
  def edit
  end
  
  
  def avaliar
    respond_to do |format|
      if @avaliacao.update(avaliacao_params)
        format.html { redirect_to @avaliacao, notice: 'Avaliacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliacao }
      else
        format.html { render :edit }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # POST /avaliacaos
  # POST /avaliacaos.json
  def create
    @avaliacao = Avaliacao.new(avaliacao_params)

    respond_to do |format|
      if @avaliacao.save
        format.html { redirect_to @avaliacao, notice: 'Avaliacao was successfully created.' }
        format.json { render :show, status: :created, location: @avaliacao }
      else
        format.html { render :new }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliacaos/1
  # PATCH/PUT /avaliacaos/1.json
  def update
    respond_to do |format|
      if @avaliacao.update(avaliacao_params)
        format.html { redirect_to @avaliacao, notice: 'Avaliacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliacao }
      else
        format.html { render :edit }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacaos/1
  # DELETE /avaliacaos/1.json
  def destroy
    @avaliacao.destroy
    respond_to do |format|
      format.html { redirect_to avaliacaos_url, notice: 'Avaliacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao
      @avaliacao = Avaliacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliacao_params
      params.require(:avaliacao).permit(:user_id, :professor_id, :itemavaliacao_id, :resp_positiva, :resp_negativa)
    end
end
