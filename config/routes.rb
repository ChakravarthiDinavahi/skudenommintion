Rails.application.routes.draw do
  get 'auth/:provider/callback' => 'sessions#callback'
  root to: 'home#index'
  get '/denomination' => "home#denomination"

  post '/denomination' => "home#proceesing"
  get '/combination' => "home#combination"


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
