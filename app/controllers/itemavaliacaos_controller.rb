class ItemavaliacaosController < ApplicationController
   before_action :authenticate_user!
  before_action :set_itemavaliacao, only: [:show, :edit, :update, :destroy]

  # GET /itemavaliacaos
  # GET /itemavaliacaos.json
  def index

    @itemavaliacaos = Itemavaliacao.all
  end

  # GET /itemavaliacaos/1
  # GET /itemavaliacaos/1.json
  def show
  end

  # GET /itemavaliacaos/new
  def new
    @itemavaliacao = Itemavaliacao.new
  end

  # GET /itemavaliacaos/1/edit
  def edit
  end

  # POST /itemavaliacaos
  # POST /itemavaliacaos.json
  def create
    @itemavaliacao = Itemavaliacao.new(itemavaliacao_params)

    respond_to do |format|
      if @itemavaliacao.save
        format.html { redirect_to @itemavaliacao, notice: 'Itemavaliacao was successfully created.' }
        format.json { render :show, status: :created, location: @itemavaliacao }
      else
        format.html { render :new }
        format.json { render json: @itemavaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itemavaliacaos/1
  # PATCH/PUT /itemavaliacaos/1.json
  def update
    respond_to do |format|
      if @itemavaliacao.update(itemavaliacao_params)
        format.html { redirect_to @itemavaliacao, notice: 'Itemavaliacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @itemavaliacao }
      else
        format.html { render :edit }
        format.json { render json: @itemavaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itemavaliacaos/1
  # DELETE /itemavaliacaos/1.json
  def destroy
    @itemavaliacao.destroy
    respond_to do |format|
      format.html { redirect_to itemavaliacaos_url, notice: 'Itemavaliacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itemavaliacao
      @itemavaliacao = Itemavaliacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itemavaliacao_params
      params.require(:itemavaliacao).permit(:item)
    end
end
