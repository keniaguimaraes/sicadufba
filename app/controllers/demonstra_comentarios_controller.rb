class DemonstraComentariosController < ApplicationController
   before_action :authenticate_user!     
 $home ="home"
    def index
            add_breadcrumb "Veja o que estão Comentando", demonstra_comentarios_path, :title => "Voltar para a Página principal"
      
        @comentarios = Comentar.select('disciplinas.nome as nome,disciplinacursos.disciplina_id as disciplina_id')
                                 .joins('JOIN disciplinacursos ON disciplinacursos.id = comentars.disciplinacurso_id ')
                                 .joins('JOIN disciplinas on disciplinas.id = disciplinacursos.disciplina_id ')
                                 .group('disciplinas.nome, disciplinacursos.disciplina_id')
                                 .order("disciplinas.nome")
                                 .paginate(:page => params[:page], :per_page => 7)
      $aux="a"   
    end                         
end
