class RestricaosController < ApplicationController
    before_action :authenticate_user!
  before_action :set_restricao, only: [:show, :edit, :update, :destroy]

  # GET /restricaos
  # GET /restricaos.json
  def index
    @restricaos = Restricao.all.paginate(:page => params[:page], :per_page => 8)
  end

  # GET /restricaos/1
  # GET /restricaos/1.json
  def show
  end

  # GET /restricaos/new
  def new
    @restricao = Restricao.new
  end

  # GET /restricaos/1/edit
  def edit
  end

  # POST /restricaos
  # POST /restricaos.json
  def create
    @restricao = Restricao.new(restricao_params)

    respond_to do |format|
      if @restricao.save
        format.html { redirect_to @restricao, notice: 'Restricao was successfully created.' }
        format.json { render :show, status: :created, location: @restricao }
      else
        format.html { render :new }
        format.json { render json: @restricao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restricaos/1
  # PATCH/PUT /restricaos/1.json
  def update
    respond_to do |format|
      if @restricao.update(restricao_params)
        format.html { redirect_to @restricao, notice: 'Restricao was successfully updated.' }
        format.json { render :show, status: :ok, location: @restricao }
      else
        format.html { render :edit }
        format.json { render json: @restricao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restricaos/1
  # DELETE /restricaos/1.json
  def destroy
    @restricao.destroy
    respond_to do |format|
      format.html { redirect_to restricaos_url, notice: 'Restricao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restricao
      @restricao = Restricao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restricao_params
      params.require(:restricao).permit(:palavra)
    end
end
