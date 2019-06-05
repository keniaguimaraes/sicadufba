class TagsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    add_breadcrumb "Tag", tags_path, :title => "Voltar para a Página principal"
    @tags = Tag.all.paginate(:page => params[:page], :per_page => 8)
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
    add_breadcrumb "Tags", tags_path, :title => "Voltar para Anterior"
    add_breadcrumb "Incluir Tag"
  end

  # GET /tags/1/edit
  def edit
    
     add_breadcrumb "tags", tags_path, :title => "Voltar para Anterior"
     add_breadcrumb "Editando tag: " +  @tag.tag
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'tag was successfully created.' }
       # format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:tag)
    end
end
