Rails.application.routes.draw do
  resources :questions, only: [:show, :index]
  resources :responses, only: [:show, :index]

  root to: 'creative_qualities#index'
end
