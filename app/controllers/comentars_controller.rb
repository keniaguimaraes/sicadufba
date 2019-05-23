class ComentarsController < ApplicationController
  require 'lingua/stemmer'
  before_action :authenticate_user!
  before_action :set_comentar, only: [:show, :edit, :update, :destroy]



  # GET /comentars
  # GET /comentars.json
  def index
    @comentars = Comentar.where("user_id =:user_id",{user_id:current_user.id}).all
                         .paginate(:page => params[:page], :per_page => 7)
  end

  # GET /comentars/1
  # GET /comentars/1.json
  def show
    @comentarios_disciplina = Comentar.select('users.email as email, cursos.nome curso ,disciplinas.nome as disciplina, professors.nome,semestres.ano,comentars.comentario as comentario') 
                                 .joins('JOIN disciplinacursos ON disciplinacursos.id = comentars.disciplinacurso_id ')
                                 .joins('JOIN disciplinas on disciplinas.id = disciplinacursos.disciplina_id ')
                                 .joins('JOIN cursos on cursos.id = disciplinacursos.curso_id ')
                                 .joins('JOIN semestres on semestres.id = comentars.semestre_id')
                                 .joins('join professors on professors.id = comentars.professor_id')
                                 .joins('JOIN users ON users.id = comentars.user_id ')
                                 .where("disciplinacursos.disciplina_id=:disciplina_id",{disciplina_id: params[:disciplina_id]}).all
                               
  end
  
  
  def mostra
       @comentarios_disciplina = Comentar.select('users.email as email, cursos.nome curso ,disciplinas.nome as disciplina, professors.nome,semestres.ano,comentars.comentario') 
                                 .joins('JOIN disciplinacursos ON disciplinacursos.id = comentars.disciplinacurso_id ')
                                 .joins('JOIN disciplinas on disciplinas.id = disciplinacursos.disciplina_id ')
                                 .joins('JOIN cursos on cursos.id = disciplinacursos.curso_id ')
                                 .joins('JOIN semestres on semestres.id = comentars.semestre_id')
                                 .joins('join professors on professors.id = comentars.professor_id')
                                 .joins('JOIN users ON users.id = comentars.user_id ')
                                 .where("disciplinacursos.disciplina_id=:disciplina_id",{disciplina_id: params[:disciplina_id]})
                                 .paginate(:page => params[:page], :per_page => 4)
  end

  # GET /comentars/new
  def new
    @comentar = Comentar.new
    @disciplinacurso = Disciplinacurso.select("disciplinas.nome||' - ' || disciplinacursos.semestre as nome, disciplinacursos.* ")
                                       .joins(" join cursos on cursos.id = disciplinacursos.curso_id")
                                       .joins(" join disciplinas on disciplinas.id = disciplinacursos.disciplina_id")
                                       .where(" disciplinacursos.curso_id =:curso_id",{curso_id:current_user.curso_id}).all
                                       .order("cursos.nome ")
    @professor = Professor.all.order("nome")

    @semestre   = Semestre.select(" cast(ano as char(4))||'.'||cast(codigo as char(1)) semestre,  * ").all
                          .order("ano,codigo")
  end

  # GET /comentars/1/edit
  def edit
    @disciplinacurso = Disciplinacurso.select("disciplinas.nome||' - ' || disciplinacursos.semestre as nome, disciplinacursos.* ")
                                       .joins(" join cursos on cursos.id = disciplinacursos.curso_id")
                                       .joins(" join disciplinas on disciplinas.id = disciplinacursos.disciplina_id")
                                       .where(" disciplinacursos.curso_id =:curso_id",{curso_id:current_user.curso_id}).all
                                       .order("cursos.nome")
    @professor = Professor.all.order("nome")

    @semestre   = Semestre.all  
  end

  # POST /comentars
  # POST /comentars.json
  def create
  
    @coment = Comentar.new(comentar_params)
    @comentario = @coment.comentario.split(' ')
    @compara = Restricao.all
    
    @restricao = []
    @restricao =  @compara.map{|compara| compara.palavra}
    
  
    stemmer= Lingua::Stemmer.new(:language => "pt")

    @resultado = []
    @resultado =  @comentario.select{ |comentario| @restricao.include?(stemmer.stem(comentario))}.map{ |comentario| comentario}
    
    @permite = true
    if  @resultado.present? then 
       @permite = false
    end
  
    respond_to do |format|
       if (@permite) then
        if @coment.save
          format.html { redirect_to '/', notice: 'Comentario Incluído!'}
        else
          format.html { render :new }
          format.json { render json: @coment.errors, status: :unprocessable_entity }
        end
       else 
          format.html { redirect_to '/', notice: 'Comentario não está no padrões permitidos! Favor refazer.' }
       end   
    end 

  end

  # PATCH/PUT /comentars/1
  # PATCH/PUT /comentars/1.json
  def update
    respond_to do |format|
      if @comentar.update(comentar_params)
        format.html { redirect_to @comentar, notice: 'Comentar was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentar }
      else
        format.html { render :edit }
        format.json { render json: @comentar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentars/1
  # DELETE /comentars/1.json
  def destroy
    @comentar.destroy
    respond_to do |format|
      format.html { redirect_to comentars_url, notice: 'Comentar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentar
      @comentar = Comentar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentar_params
      params.require(:comentar).permit(:user_id, :disciplinacurso_id, :professor_id, :semestre_id,:comentario)
    end
end
