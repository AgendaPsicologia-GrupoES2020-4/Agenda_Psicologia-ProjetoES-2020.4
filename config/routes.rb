Rails.application.routes.draw do
  get 'agenda', to: 'psicologos#main'
  resources :psicologos do
    resources :pacientes
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'landing', to: 'sessions#landing'
  delete 'logout', to: 'sessions#destroy'
  root 'sessions#landing'

end
