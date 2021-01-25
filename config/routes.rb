Rails.application.routes.draw do
  get 'pacientes/new'
  get 'pacientes/index'
  resources :pacientes
  root 'pacientes#index'
  get 'index' => 'pacientes#index'

end
