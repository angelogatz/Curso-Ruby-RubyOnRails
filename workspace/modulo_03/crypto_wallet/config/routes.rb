Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  get '/Home', to: 'welcome#index'
  
  resources :coins

  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
