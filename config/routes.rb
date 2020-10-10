Rails.application.routes.draw do
  get 'tag/index'
  get '/' => 'home#index'
  resources :article, only: [:show]
  resources :tag, only: [:index,:show]
  resources :lyrics, only: [:show]
  resources :search, only: [:index]
end
