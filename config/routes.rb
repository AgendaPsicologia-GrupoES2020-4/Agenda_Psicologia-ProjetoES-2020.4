Rails.application.routes.draw do

  resources :psicologos do
    member do
      get 'agenda', to: 'psicologos#main'
    end
    resources :pacientes
    resources :sessaos
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'landing', to: 'sessions#landing'
  delete 'logout', to: 'sessions#destroy'
  root 'sessions#landing'

end
