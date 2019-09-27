Rails.application.routes.draw do

  devise_for :users
  root to: "larps#index"

  resources :goals

  resources :larps do
    resources :characters
    resources :items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
