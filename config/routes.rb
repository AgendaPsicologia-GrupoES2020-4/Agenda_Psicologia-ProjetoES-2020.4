Rails.application.routes.draw do
  resources :psicologos, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'landing', to: 'sessions#landing'

  get 'pacientes/new'
  get 'pacientes/index'
  resources :pacientes
  root 'pacientes#index'
  get 'index' => 'pacientes#index'

end
