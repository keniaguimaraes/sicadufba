class AvaliacaoprofsController < ApplicationController
  before_action :set_avaliacaoprof, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /avaliacaoprofs
  # GET /avaliacaoprofs.json
  def index
    add_breadcrumb "Minhas Avaliações Docente", avaliacaoprofs_path, :title => "Voltar para a Página principal"
    user = Digest::SHA2.new << current_user.username+ENV['CHAVE']
    @usuarios = Usuario.where("username=:username",{username:user.to_s}).all
    user_id=0
    @usuarios.each do |usuario| 
       user_id = usuario.id     
    end 

    @avaliacaoprofs = Avaliacaoprof.where("user_id =:user_id",{user_id:user_id}).all
                                   .paginate(:page => params[:page], :per_page => 7)
  end

  # GET /avaliacaoprofs/1
  # GET /avaliacaoprofs/1.json
  def show
     add_breadcrumb "Minhas Avaliações Docente", avaliacaoprofs_path, :title => "Voltar para a Página principal"
     add_breadcrumb "Exibindo Avaliação"
  end

  # GET /avaliacaoprofs/new
  def new
    @avaliacaoprof = Avaliacaoprof.new
    user = Digest::SHA2.new << current_user.username+ENV['CHAVE']
    @usuarios = Usuario.where("username=:username",{username:user.to_s}).all
    curso_id=0
    @usuarios.each do |usuario| 
       curso_id = usuario.curso_id     
    end 
             
    @disciplinacurso = Disciplinacurso.select(" ' ( ' ||disciplinacursos.semestre||' )  ' || disciplinas.nome as nome, disciplinacursos.* ")
                                       .joins(" join cursos on cursos.id = disciplinacursos.curso_id")
                                       .joins(" join disciplinas on disciplinas.id = disciplinacursos.disciplina_id")
                                       .where(" disciplinacursos.curso_id =:curso_id",{curso_id:curso_id}).all
                                       .order("coalesce(disciplinacursos.semestre, '999')")
    @professor = Professor.all.order("nome")

    @semestre   = Semestre.select(" cast(ano as char(4))||'.'||cast(codigo as char(1)) semestre,  * ").all
                          .order("ano,codigo")
 
    add_breadcrumb "Avaliação Docente", avaliacaoprofs_path, :title => "Voltar para Anterior"
    add_breadcrumb "Incluir Avaliação Docente"
  end

  # GET /avaliacaoprofs/1/edit
  def edit
    @professor = Professor.all.order("nome")
  end

  # POST /avaliacaoprofs
  # POST /avaliacaoprofs.json
  def create
    @avaliacaoprof = Avaliacaoprof.new(avaliacaoprof_params)
    
    
     user_id =  @avaliacaoprof.user_id
     disciplinacurso_id=  @avaliacaoprof.disciplinacurso_id
     professor_id=  @avaliacaoprof.professor_id
     semestre_id=  @avaliacaoprof.semestre_id
  
     verifica_avaliacao = Avaliacaoprof.where("user_id=:user_id and disciplinacurso_id=:disciplinacurso_id and professor_id=:professor_id and semestre_id=:semestre_id",{user_id:user_id, disciplinacurso_id:disciplinacurso_id,professor_id:professor_id,semestre_id:semestre_id}).exists?
     
     if !verifica_avaliacao  then
  
        @tagselect =  params[:tags]
       
        @ult_avaliacao = Avaliacaoprof.last
        if @ult_avaliacao.nil? 
          proximo = 1
        else proximo = @ult_avaliacao.id + 1
        end 
        
        if  not @tagselect.nil?  then
          @tagselect.each do |tagselect|
            @avaliacaotag = Avaliacaotag.new
            @avaliacaotag.tag_id = tagselect
            @avaliacaotag.avaliacaoprof_id = proximo
            @avaliacaotag.save
          end  
        end
    
        respond_to do |format|
          if @avaliacaoprof.save
            format.html { redirect_to '/', notice: 'A Avaliação foi Realizada com Sucesso!'}
          else
            format.html { render :new }
            format.json { render json: @avaliacaoprof.errors, status: :unprocessable_entity }
          end
        end  
     else 
       message = 'Você já realizou a avaliação para esta disciplina neste semestre com esse professor!'
       redirect_to '/avaliacaoprofs/new', notice: message
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
=begin
    id = @avaliacaoprof.id
    @tagselect = Avaliacaotag.where("avaliacaoprof_id=:avaliacaoprof_id",{avaliacaoprof_id: id})
    @tagselect.destroy
=end   
    @avaliacaoprof.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Avaliacaoprof was successfully destroyed.'}
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
      params.require(:avaliacaoprof).permit(:user_id, :professor_id, :semestre_id,:disciplinacurso_id, :data_avaliacao, :dominio_conteudo, :relacionamento_alunos, :possui_didatica, :recomendaria_professor)
    end
    
    
end
