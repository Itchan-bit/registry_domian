Rails.application.routes.draw do
  root to: "home#index"
  
  resources :domains
  resources :registrants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
