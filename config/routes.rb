Rails.application.routes.draw do
  resources :tipoperfils
  resources :avaliacaoprofs
  resources :comentariotags
  resources :tags
  resources :coments
  resources :restricaos
  resources :avaliacaos
  resources :itemavaliacaos
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
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
get '/check.txt', to: proc {[200, {}, ['it_works']]}
  root 'home#index', :as => 'contact_us'

 resources :comentars do
     member do
       get 'mostra'=> 'comentars#mostra'
       get 'all'=> 'comentars#all'
       get 'bloquear'=> 'comentars#bloquear'
       get 'desbloquear'=> 'comentars#desbloquear'
       get 'denunciar'=> 'comentars#denunciar'
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
    get '/perfil' => 'devise/registrations#edit'
    get '/user' => 'user#index'
 end
 resources :user do
     member do
        get 'bloquear' => 'user#bloquear'
        get 'desbloquear' => 'user#desbloquear'
    end
 end
  resources :resultados do
     member do
        get 'apurarcoment' => 'resultados#apurarcoment'
        get 'apuraravalia' => 'resultados#apuraravalia'
        get 'gerarelcoment' => 'resultados#gerarelcoment'
        get 'gerarelavalia' => 'resultados#gerarelavalia'
        #get 'comprovante'=> 'cautelas#comprovante'
    end
 end

  
end
