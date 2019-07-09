class ResultadosController < ApplicationController
    before_action :authenticate_user!
    
    def index
        add_breadcrumb "Resultados por Semestre", resultado_semestre_path, :title => "Voltar para a Página principal"
        add_breadcrumb "Restrição por Professor"
        @resultados = Avaliacaoprof.select("professors.nome, avaliacaoprofs.professor_id, count(professors.nome) qtd")
                                    .joins("JOIN professors ON professors.id = avaliacaoprofs.professor_id" )
                                    .joins("JOIN semestres ON semestres.id = avaliacaoprofs.semestre_id" )
                                    .where("cast(semestres.ano as char(4))||cast(semestres.codigo as char(1)) =:ano_semestre",{ano_semestre:params[:ano_semestre]})
                                    .group("professors.nome, avaliacaoprofs.professor_id").all    
    end
    
    def professor
        add_breadcrumb "Result. Semestre", resultado_semestre_path, :title => "Voltar para a Página principal"
        add_breadcrumb "Result.Professor", resultado_professor_path, :title => "Voltar para a Página principal"
        add_breadcrumb "Resultados Avaliações"
      
        @disciplina = Avaliacaoprof.select("disciplinas.nome,avaliacaoprofs.professor_id,disciplinas.codigo, count(disciplinas.nome)as qtd_avaliacoes, cast(semestres.ano as char(4))||cast(semestres.codigo as char(1)) as ano, disciplinacursos.id as disciplinacurso_id")
                                    .joins("JOIN disciplinacursos ON disciplinacursos.id = avaliacaoprofs.disciplinacurso_id" )
                                    .joins("JOIN disciplinas ON disciplinas.id = disciplinacursos.disciplina_id" )
                                    .joins("JOIN semestres ON semestres.id = avaliacaoprofs.semestre_id" )
                                    .where("avaliacaoprofs.professor_id =:professor_id and cast(semestres.ano as char(4))||cast(semestres.codigo as char(1)) =:ano_semestre",{professor_id:params[:professor_id],ano_semestre:params[:ano_semestre]})
                                    .group("disciplinas.nome,avaliacaoprofs.professor_id,disciplinacursos.id,disciplinas.codigo,").all
                                    
    end
    
    def semestre
     add_breadcrumb "Resultados por Semestre"
     @semestre = Avaliacaoprof.select("cast(semestres.ano as char(4))||cast(semestres.codigo as char(1)) as nome, count(semestres.ano) as qtd ")
                                    .joins("JOIN semestres ON semestres.id = avaliacaoprofs.semestre_id" )
                                    .group(" cast(semestres.ano as char(4))||cast(semestres.codigo as char(1))").all 
    end 
    
    def comentario
    

    end
    
    
    def apurarcoment

          @qtd_comentarios = Comentar.all   
                                    
          @qtd_disciplinas = Comentar.select("disciplinacursos.disciplina_id")
                                    .joins("JOIN disciplinacursos ON disciplinacursos.id = comentars.disciplinacurso_id" )
                                    .group("disciplinacursos.disciplina_id").all                                  
        
          
          @qtd_usuarios    = Comentar.select("user_id as qtd_usuario").group(:user_id).all
          
          @resultados      = Resultado.where("tiporesultado_id = 1").all
 

          if  @resultados.empty?
            @apura_comentario = Resultado.new()
            @apura_comentario.tiporesultado_id  = 1
            @apura_comentario.data_apuracao  =  DateTime.now 
            @apura_comentario.data_abertura  =  nil
            @apura_comentario.semestre_id    =  3
            @apura_comentario.qtd_disciplinas          = @qtd_disciplinas.sizes
            @apura_comentario.qtd_comentarios          = @qtd_comentarios.size
            @apura_comentario.qtd_usuarios             = @qtd_usuarios.size
            @apura_comentario.qtd_docentes             =  0
            @apura_comentario.qtd_avaliacoes           = 0
            @apura_comentario.qtd_boa_didatica         = 0
            @apura_comentario.qtd_docentes             = 0
            @apura_comentario.qtd_avaliacoes           = 0
            @apura_comentario.qtd_bom_relacionamento   = 0
            @apura_comentario.qtd_bom_dominio          = 0
            @apura_comentario.qtd_nivel_recomendacao   = 0
            if @apura_comentario.save
              redirect_to "/resultados", notice: 'A apuração dos comentarios foi realizada com sucesso!'  
            else
              redirect_to "/resultados", notice: 'Não'  
            end
          else
          end
    end
    
    
    def gerarelcoment
         @qtd_coment_disc = Comentar.select("count(comentars.id) as qtd_comentarios, disciplinas.nome as disciplina")
                                    .joins("JOIN disciplinacursos ON disciplinacursos.id = comentars.disciplinacurso_id" )
                                    .joins("JOIN disciplinas ON disciplinas.id = disciplinacursos.disciplina_id" )
                                    .group("disciplinas.nome").all
         respond_to do |format|
           format.html
           format.pdf { render pdf: "",
             footer: { center: "[page] of [topage]" }
           }
          
          
         end     
    end
end   
