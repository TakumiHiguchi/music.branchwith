Rails.application.routes.draw do
  get '/' => 'home#index'
  resources :article, only: [:show]
  resources :tag, only: [:index,:show]
  resources :lyrics, only: [:show]
  resources :search, only: [:index]
  resources :instagram, only: [:index, :show]

  get 'privacy' => 'pages#privacy'
  get 'contact' => 'pages#contact'
end
