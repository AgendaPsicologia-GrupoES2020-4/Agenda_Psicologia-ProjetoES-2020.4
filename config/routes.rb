Rails.application.routes.draw do
  resources :psicologos, only: [:new, :create] 
  get 'agenda', to: 'psicologos#main'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'landing', to: 'sessions#landing'
  delete 'logout', to: 'sessions#destroy'
  
  resources :pacientes
  get 'pacientes/new'
  get 'pacientes/index'
  get 'index' => 'pacientes#index'
  
  root 'sessions#landing'
end
