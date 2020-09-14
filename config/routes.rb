Rails.application.routes.draw do
  get 'lyric/index'
  get 'lyric/show'
  get '/' => 'home#index'
  resources :article, only: [:show]
  resources :lyrics, only: [:index,:show]
end
