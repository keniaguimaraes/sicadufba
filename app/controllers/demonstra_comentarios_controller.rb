class DemonstraComentariosController < ApplicationController
   before_action :authenticate_user!     
 $home ="home"
    def index
       add_breadcrumb "Veja o que estão Comentando", demonstra_comentarios_path, :title => "Voltar para a Página principal"
       
     @comentarios = Comentar.all
     
    if @comentarios.present?
      @temequip = 1
    else
      @temequip = 0
    end
    
      if params[:search]
       
         @comentarios = Comentar.select('disciplinas.nome as nome,disciplinacursos.disciplina_id as disciplina_id')
                                 .joins('JOIN disciplinacursos ON disciplinacursos.id = comentars.disciplinacurso_id ')
                                 .joins('JOIN disciplinas on disciplinas.id = disciplinacursos.disciplina_id ')
                                 .where("disciplinas.nome like ?", "%#{params[:search]}%")
                                 .group('disciplinas.nome, disciplinacursos.disciplina_id')
                                 .order("disciplinas.nome")
                                 .paginate(:page => params[:page], :per_page => 7)
      else
        @comentarios = Comentar.select('disciplinas.nome as nome,disciplinacursos.disciplina_id as disciplina_id')
                                 .joins('JOIN disciplinacursos ON disciplinacursos.id = comentars.disciplinacurso_id ')
                                 .joins('JOIN disciplinas on disciplinas.id = disciplinacursos.disciplina_id ')
                                 .group('disciplinas.nome, disciplinacursos.disciplina_id')
                                 .order("disciplinas.nome")
                                 .paginate(:page => params[:page], :per_page => 7)
      end                           
      $aux="a"   
    end                         
end
