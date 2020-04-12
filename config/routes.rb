Rails.application.routes.draw do
  get 'ingredients/new'
  devise_for :users
  root to: 'pages#home'
  resources :recipes do
    resources :ingredients, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
