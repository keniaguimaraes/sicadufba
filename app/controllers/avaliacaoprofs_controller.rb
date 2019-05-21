class AvaliacaoprofsController < ApplicationController
  before_action :set_avaliacaoprof, only: [:show, :edit, :update, :destroy]

  # GET /avaliacaoprofs
  # GET /avaliacaoprofs.json
  def index
    @avaliacaoprofs = Avaliacaoprof.all
  end

  # GET /avaliacaoprofs/1
  # GET /avaliacaoprofs/1.json
  def show
  end

  # GET /avaliacaoprofs/new
  def new
    @avaliacaoprof = Avaliacaoprof.new
    @professor = Professor.all.order("nome")
       
  end

  # GET /avaliacaoprofs/1/edit
  def edit
  end

  # POST /avaliacaoprofs
  # POST /avaliacaoprofs.json
  def create
    @avaliacaoprof = Avaliacaoprof.new(avaliacaoprof_params)

    respond_to do |format|
      if @avaliacaoprof.save
        format.html { redirect_to '/', notice: 'Avaliacaoprof was successfully created.' }
      
      else
        format.html { render :new }
        format.json { render json: @avaliacaoprof.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliacaoprofs/1
  # PATCH/PUT /avaliacaoprofs/1.json
  def update
    respond_to do |format|
      if @avaliacaoprof.update(avaliacaoprof_params)
        format.html { redirect_to  '/', notice: 'Avaliacaoprof was successfully updated.' }
      
      else
        format.html { render :edit }
        format.json { render json: @avaliacaoprof.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacaoprofs/1
  # DELETE /avaliacaoprofs/1.json
  def destroy
    @avaliacaoprof.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Avaliacaoprof was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacaoprof
      @avaliacaoprof = Avaliacaoprof.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliacaoprof_params
      params.require(:avaliacaoprof).permit(:user_id, :professor_id, :semestre_id, :data_avaliacao, :dominio_conteudo, :relacionamento_alunos, :possui_didatica, :recomendaria_professor)
    end
end
