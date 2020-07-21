Rails.application.routes.draw do
  get 'step/new'
  get 'ingredients/new'
  devise_for :users
  # root to: 'pages#home'
  root to: 'recipes#index'
  resources :recipes do
    resources :ingredients, only: [:new, :create, :edit, :destroy]
    resources :steps, only: [:new, :create, :delete]
  end
end
