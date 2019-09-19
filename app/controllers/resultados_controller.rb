class ResultadosController < ApplicationController
    before_action :authenticate_user!
    
    def index
        add_breadcrumb "Resultados por Professor"
        @resultados = Avaliacaoprof.select("professors.nome, avaliacaoprofs.professor_id, count(professors.nome) qtd")
                                    .joins("JOIN professors ON professors.id = avaliacaoprofs.professor_id" )
                                    .joins("JOIN semestres ON semestres.id = avaliacaoprofs.semestre_id" )
                                    .group("professors.nome, avaliacaoprofs.professor_id").all    
    end
    
    def professor2
        add_breadcrumb "Result. Semestre", resultado_semestre_path, :title => "Voltar para a Página principal"

        add_breadcrumb "Resultados Avaliações"
      
        @disciplina = Avaliacaoprof.select("disciplinas.nome,avaliacaoprofs.professor_id,disciplinas.codigo, count(disciplinas.nome)as qtd_avaliacoes, cast(semestres.ano as char(4))||cast(semestres.codigo as char(1)) as ano, disciplinacursos.id as disciplinacurso_id")
                                    .joins("JOIN disciplinacursos ON disciplinacursos.id = avaliacaoprofs.disciplinacurso_id" )
                                    .joins("JOIN disciplinas ON disciplinas.id = disciplinacursos.disciplina_id" )
                                    .joins("JOIN semestres ON semestres.id = avaliacaoprofs.semestre_id" )
                                    .where("avaliacaoprofs.professor_id =:professor_id and cast(semestres.ano as char(4))||cast(semestres.codigo as char(1)) =:ano_semestre",{professor_id:params[:professor_id],ano_semestre:params[:ano_semestre]})
                                    .group("disciplinas.nome,avaliacaoprofs.professor_id,disciplinacursos.id,disciplinas.codigo,cast(semestres.ano as char(4))||cast(semestres.codigo as char(1))").all
                                    
    end
    
    def semestre
     add_breadcrumb "Resultados por Semestre"
     @semestre = Avaliacaoprof.select("cast(semestres.ano as char(4))||cast(semestres.codigo as char(1)) as nome, count(cast(semestres.ano as char(4))||cast(semestres.codigo as char(1))) as qtd ")
                                    .joins("JOIN semestres ON semestres.id = avaliacaoprofs.semestre_id" )
                                    .group("cast(semestres.ano as char(4))||cast(semestres.codigo as char(1))").all 
    end 

    def professor
      add_breadcrumb "Resultados por Professor", resultados_path, :title => "Voltar para a Página principal"
      add_breadcrumb "Resultados Avaliações"
      @semestre = Avaliacaoprof.select(" cast(semestres.ano as char(4))||cast(semestres.codigo as char(1)) as ano")
                                    .joins("JOIN semestres ON semestres.id = avaliacaoprofs.semestre_id" )
                                    .where("avaliacaoprofs.professor_id =:professor_id ",{professor_id:params[:professor_id]})
                                    .group("cast(semestres.ano as char(4))||cast(semestres.codigo as char(1))").all 
  
                                
      @professor = Avaliacaoprof.select("professors.nome, avaliacaoprofs.professor_id")
                                .joins("JOIN professors ON professors.id = avaliacaoprofs.professor_id" )
                                .where("avaliacaoprofs.professor_id =:professor_id ",{professor_id:params[:professor_id]})
                                .group("professors.nome, avaliacaoprofs.professor_id").all    
                                
                                    
                                            
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
