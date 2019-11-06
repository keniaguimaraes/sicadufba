class ComentarsController < ApplicationController
  require 'lingua/stemmer'
  before_action :authenticate_user!
  before_action :index, only: [:show, :edit, :update, :destroy]

  # GET /comentars
  # GET /comentars.json
  def index
    add_breadcrumb "Meus Comentários", comentars_path, :title => "Voltar para a página principal"
    user = Digest::SHA2.new << current_user.username+ENV['CHAVE']
    @usuarios = Usuario.where("username=:username",{username:user.to_s}).all
    user_id=0
    @usuarios.each do |usuario| 
       user_id = usuario.id     
    end
    @comentars = Comentar.where("user_id =:user_id",{user_id:user_id}).all
                         .paginate(:page => params[:page], :per_page => 7)
  end
  
  
  def all
     add_breadcrumb "Todos Comentários", "comentars/0/all", :title => "Voltar para a página principal"
     @comentars = Comentar.select("usuarios.username, comentars.*").joins("JOIN usuarios ON usuarios.id = comentars.user_id").all.order("data_comentario")
                         .paginate(:page => params[:page], :per_page =>7)
  end


  # GET /comentars/1
  # GET /comentars/1.json
  def show
       @comentarios_disciplina =  Comentar.find(params[:id])
       add_breadcrumb "Exibindo Comentário" 
  end
  
  def mostra
    if  params[:professor_id] != '0' then
            @comentarios_disciplina = Comentar.select(' cursos.nome curso ,disciplinas.nome as disciplina, professors.nome,semestres.ano,comentars.comentario,comentars.data_comentario,comentars.id, disciplinacursos.disciplina_id as disciplina_id') 
                                 .joins('JOIN disciplinacursos ON disciplinacursos.id = comentars.disciplinacurso_id ')
                                 .joins('JOIN disciplinas on disciplinas.id = disciplinacursos.disciplina_id ')
                                 .joins('JOIN cursos on cursos.id = disciplinacursos.curso_id ')
                                 .joins('JOIN semestres on semestres.id = comentars.semestre_id')
                                 .joins('join professors on professors.id = comentars.professor_id')
                                 .joins('JOIN usuarios ON usuarios.id = comentars.user_id ')
                                 .where("disciplinacursos.disciplina_id=:disciplina_id and comentars.professor_id = :professor_id and comentars.semestre_id = :semestre_id  and  comentars.bloqueio = '0' and comentars.oculta = '0' ",{disciplina_id: params[:disciplina_id],professor_id: params[:professor_id],semestre_id: params[:semestre_id]})
                                 .paginate(:page => params[:page], :per_page => 4)
                                 .order("comentars.data_comentario desc, professors.nome")
    else 
             @comentarios_disciplina = Comentar.select(' cursos.nome curso ,disciplinas.nome as disciplina, professors.nome,semestres.ano,comentars.comentario,comentars.data_comentario,comentars.id, disciplinacursos.disciplina_id as disciplina_id') 
                                 .joins('JOIN disciplinacursos ON disciplinacursos.id = comentars.disciplinacurso_id ')
                                 .joins('JOIN disciplinas on disciplinas.id = disciplinacursos.disciplina_id ')
                                 .joins('JOIN cursos on cursos.id = disciplinacursos.curso_id ')
                                 .joins('JOIN semestres on semestres.id = comentars.semestre_id')
                                 .joins('join professors on professors.id = comentars.professor_id')
                                 .joins('JOIN usuarios ON usuarios.id = comentars.user_id ')
                                 .where("disciplinacursos.disciplina_id=:disciplina_id and comentars.bloqueio = '0' and comentars.oculta = '0' ",{disciplina_id: params[:disciplina_id]})
                                 .paginate(:page => params[:page], :per_page => 4)
                                 .order("comentars.data_comentario desc, professors.nome")
    end
    add_breadcrumb "Veja o que estão comentando",demonstra_comentarios_path, :title => "Voltar para Anterior" 
    add_breadcrumb "Comentários da disciplina" 
  end  
  
  # GET /comentars/new
  def new
    @comentar = Comentar.new

    user = Digest::SHA2.new << current_user.username+ENV['CHAVE']
    @usuarios = Usuario.where("username=:username",{username:user.to_s}).all
    curso_id = 0
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
                        
    add_breadcrumb "Comentários", comentars_path, :title => "Voltar para Anterior"
    add_breadcrumb "Incluir Comentário"                       
  end

  def bloquear 
      @comentar = Comentar.find(params[:id])
      respond_to do |format|
        @comentar.update(bloqueio: true)
        @comentar.update(data_bloqueio: Time.now)
        message ='Comentário Bloqueado!'
        format.html { redirect_to "/comentars/0/all",notice:message }
     end  
  end  
  
  def desbloquear 
      @comentar = Comentar.find(params[:id])
      respond_to do |format|
        @comentar.update(bloqueio: false)
        menssagem= 'Comentário Desbloqueado!!'  
        format.html { redirect_to "/comentars/0/all",notice:menssagem }
      end  
  end  


  def mostrar 
      @comentar = Comentar.find(params[:id])
      respond_to do |format|
        @comentar.update(oculta: false)
        message ='Comentário Público!'
        format.html { redirect_to comentars_path,notice:message }
     end  
  end 
  
  def ocultar 
      @comentar = Comentar.find(params[:id])
      respond_to do |format|
        @comentar.update(oculta: true)
        message ='Comentário Ocultado!'
        format.html { redirect_to comentars_path,notice:message }
     end  
  end 

  def denunciar
      @comentar = Comentar.find(params[:id])
      contabiliza_denuncia = 0
      numero_denuncia = 0
      numero_denuncia = @comentar.denuncia
      contabiliza_denuncia = numero_denuncia + 1
      comentou = false
      user = Digest::SHA2.new << current_user.username+ENV['CHAVE']
      @usuarios = Usuario.where("username=:username",{username:user.to_s}).all
      user_id = 0
      @usuarios.each do |usuario| 
        user_id = usuario.id
      end
    
      @usuario_denuncia = Denunciacomentario.select("denunciacomentarios.*")
                                             .where(" comentar_id =:comentar_id and usuario_id=:usuario_id",{comentar_id:@comentar.id, usuario_id:user_id}).all
      if !(@usuario_denuncia.empty?) then 
        comentou = true
      end  
      respond_to do |format|
        if comentou==false then 
         @comentar.update(denuncia: contabiliza_denuncia)
         
         @comentardenuncia = Denunciacomentario.new
         @comentardenuncia.usuario_id = user_id
         @comentardenuncia.comentar_id = @comentar.id
         @comentardenuncia.save
         menssagem = 'Comentário Denunciado!'  
        else
         menssagem= 'Você já denunciou esse comentário! Estamos apurando.' 
        end  
        format.html { redirect_to "/comentars/0/mostra?disciplina_id="+@comentar.disciplinacurso.disciplina_id.to_s, notice:menssagem}
      end  
  end  
  
  # GET /comentars/1/edit
  def edit
    user = Digest::SHA2.new << current_user.username+ENV['CHAVE']
    @usuarios = Usuario.where("username=:username",{username:user.to_s}).all
    curso_id=0
    @usuarios.each do |usuario| 
       curso_id = usuario.curso_id    
    end
    @disciplinacurso = Disciplinacurso.select("disciplinas.nome||' - ' || disciplinacursos.semestre as nome, disciplinacursos.* ")
                                       .joins(" join cursos on cursos.id = disciplinacursos.curso_id")
                                       .joins(" join disciplinas on disciplinas.id = disciplinacursos.disciplina_id")
                                       .where(" disciplinacursos.curso_id =:curso_id",{curso_id:curso_id}).all
                                       .order("cursos.nome")
    @professor = Professor.all.order("nome")

    @semestre   = Semestre.select(" cast(ano as char(4))||'.'||cast(codigo as char(1)) semestre,  * ").all
                          .order("ano,codigo") 
  end
  
  def remover_acentos(texto)
    return texto if texto.blank?
    texto = texto.gsub(/(á|à|ã|â|ä)/, 'a').gsub(/(é|è|ê|ë)/, 'e').gsub(/(í|ì|î|ï)/, 'i').gsub(/(ó|ò|õ|ô|ö)/, 'o').gsub(/(ú|ù|û|ü)/, 'u')
    texto = texto.gsub(/(Á|À|Ã|Â|Ä)/, 'A').gsub(/(É|È|Ê|Ë)/, 'E').gsub(/(Í|Ì|Î|Ï)/, 'I').gsub(/(Ó|Ò|Õ|Ô|Ö)/, 'O').gsub(/(Ú|Ù|Û|Ü)/, 'U')
    texto = texto.gsub(/ñ/, 'n').gsub(/Ñ/, 'N')
    texto = texto.gsub(/ç/, 'c').gsub(/Ç/, 'C')
    texto
  end
  
  # POST /comentars
  # POST /comentars.json
  def create
     @coment = Comentar.new(comentar_params)
    
     user_id =  @coment.user_id
     disciplinacurso_id=  @coment.disciplinacurso_id
     professor_id=  @coment.professor_id
     semestre_id=  @coment.semestre_id
  
      verifica_comentario = Comentar.where("user_id=:user_id and disciplinacurso_id=:disciplinacurso_id and professor_id=:professor_id and semestre_id=:semestre_id",{user_id:user_id, disciplinacurso_id:disciplinacurso_id,professor_id:professor_id,semestre_id:semestre_id}).exists?
     
     if !verifica_comentario  then
      @comentario = @coment.comentario.split(' ')
      @comentario =  @comentario.map{|comentario| remover_acentos(comentario).gsub /[^\w\s]/, ''}#remove acentuação
      
      @compara = Restricao.all
      @restricao = []
      @restricao =  @compara.map{|compara| remover_acentos(compara.palavra).downcase}
      
      stemmer = Lingua::Stemmer.new(:language => "pt")
  
      @resultado = []
      @resultado =  @comentario.select{ |comentario| @restricao.include?(stemmer.stem(comentario.downcase))}.map{ |comentario| comentario}
      
      @permite = true
      if  @resultado.present? then 
         @permite = false
      end
    
      respond_to do |format|
         if (@permite) then
            if @coment.save
              format.html { redirect_to '/demonstra_comentarios', notice: 'Comentário Incluído!'}
              format.html { render :new }
              format.json { render json: @coment.errors, status: :unprocessable_entity }
            end
         else 
            format.html { redirect_to '/comentars/new', notice: 'O comentário não está nos padrões permitidos! Favor refazer.' }
         end   
      end 
     else  message = 'Você já realizou um comentário para esta disciplina neste semestre!'
         redirect_to '/comentars/new', notice: message
    
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
      params.require(:comentar).permit(:user_id, :disciplinacurso_id, :professor_id, :semestre_id,:comentario, :data_comentario,:denuncia,:bloqueio, :data_bloqueio)
    end
end