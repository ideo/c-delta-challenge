Rails.application.routes.draw do
  resources :questions, only: [:show, :index]
  resources :survey_responses, only: [:show, :index]
  resources :creative_qualities, only: [:index]

  root to: 'creative_qualities#index'
end
