Rails.application.routes.draw do
  get '/' => 'home#index'
  resources :article, only: [:show]
  resources :tag, only: [:index,:show]
  resources :lyrics, only: [:show]
  resources :search, only: [:index]
  resources :instagram, only: [:index, :show]

  get 'privacy' => 'pages#privacy'
  get 'contact' => 'pages#contact'

  # 旧式サイトから301リダイレクトするためのルーティング。後々消す
  get 'element/music/:id' => 'ord_url_redirect#article'
  get 'element/feature/:id' => 'ord_url_redirect#article'
end
