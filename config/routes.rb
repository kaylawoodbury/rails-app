Rails.application.routes.draw do
  get 'articles/index'

  resources :articles#, only: [:index, :show, :new, :edit]
  root controller: :articles, action: :index
  
  #post 'articles/new'
  #resources :articles, only: [:new, :create]

  #post '/articles/edit'
  #resources :articles, only: [ :show, :edit]
end


