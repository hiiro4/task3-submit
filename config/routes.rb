Rails.application.routes.draw do
  devise_for :users
 resources:books,only:[:index,:show,:create,:new,:destroy,:edit,:update]
 resources :users, only: [:show,:edit,:update,:index]
 get"books"=>"books#index"

 post "books"=>"books#create"
get"home/about"=>"books#about"

  root to:"books#top"
end