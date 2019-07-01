class FaqController < ApplicationController
    def index
      add_breadcrumb "F.A.Q","/faq", :title => "Voltar para Anterior"

    end
    
    def comentarios
         add_breadcrumb "F.A.Q", "/faq", :title => "Voltar para Anterior"
         add_breadcrumb "Comentário"
    end 
    
    def avaliacoes
      add_breadcrumb "F.A.Q", "/faq", :title => "Voltar para Anterior"
      add_breadcrumb "Avaliação"
    end  
    
    def show
    end  
end
