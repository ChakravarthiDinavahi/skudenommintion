Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions"}
  get 'auth/:provider/callback' => 'sessions#callback'
  root to: 'home#index'
  get '/denomination' => "home#denomination"

  post '/denomination' => "home#proceesing"
  get '/combination' => "home#combination"



  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
