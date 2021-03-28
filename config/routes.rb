Rails.application.routes.draw do
  devise_for :users
  root :to => "grams#index"
  resources :grams
  resources :users
  match 'users/:id' => 'users#show', via: :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
