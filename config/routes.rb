Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index', :as => 'search_page'


  post 'payment/create', to: 'payment#create'
  post 'payment/execute', to: 'payment#execute'


  resources :registrants
  resources :domains
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
