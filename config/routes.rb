Rails.application.routes.draw do

  resources :tipoperfils
  resources :avaliacaoprofs
  resources :comentariotags
  resources :tags
  resources :coments
  resources :restricaos
  resources :disciplinacursos
  resources :cursos
  resources :semestres
  resources :professors
  resources :disciplinas
  resources :demonstra_comentarios
  resources :comentars
  resources :home
  resources :admin
  resources :user
  resources :resultados
  resources :faq
  resources :usuarios
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
  root 'home#index'
 resources :comentars do
     member do
       get 'mostra'=> 'comentars#mostra'
       get 'all'=> 'comentars#all'
       get 'bloquear'=> 'comentars#bloquear'
       get 'desbloquear'=> 'comentars#desbloquear'
       get 'denunciar'=> 'comentars#denunciar'
       get 'mostrar'=> 'comentars#mostrar'
       get 'ocultar'=> 'comentars#ocultar'
    end
 end
 
 
resources :admin do
     member do
       get 'crawlcurso'=> 'admin#crawlcurso'
       get 'crawldisc'=> 'admin#crawldisc'
       get 'crawlprof'=> 'admin#crawlprof'
       get 'crawltitle' => 'admin#crawltitle'
       get 'clear'=> 'admin#clear'
    end
 end

 devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
   # get '/perfil' => 'devise/registrations#edit'
    get '/user' => 'user#index'
 end
 resources :user do
     member do
        get 'bloquear' => 'user#bloquear'
        get 'desbloquear' => 'user#desbloquear'
    end
 end
 
  get "faq_avaliacoes", to: "faq#avaliacoes"
  get 'faq_comentarios', to: 'faq#comentarios'
  get 'faq_resultados', to: 'faq#resultados'
  #get 'resultado_professor', to: 'resultados#professor'
  get 'resultado_semestre', to: 'resultados#index'
  get 'contato' => 'application#contact', :as => 'contact_us'
  post 'contato' => 'application#send_contact', :as => 'send_contact'
  get 'resultado_professor', to: 'resultados#professor'
  get 'todos_comentarios', to: 'comentars#mostra'
   resources :usuarios do
     member do
        get 'bloquear' => 'usuarios#bloquear'
        get 'desbloquear' => 'usuarios#desbloquear'
        get 'perfil' => 'usuarios#perfil'
    end    
 end
end
