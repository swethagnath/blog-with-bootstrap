Rails.application.routes.draw do
  get '/categories/find_category'
  get '/articles/article_title'
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources:categories
  resources:articles
  resources:comments
  root 'articles#index'
end
