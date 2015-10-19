Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'

  resources :questions do
    resources :answers
  end
  resources :answers
  namespace :admin do
    resources :users
  end
  

  resources :tags

end
