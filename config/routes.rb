Rails.application.routes.draw do
  devise_for :users, 
  	:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :projects do
    collection do
      get '/user_projects', to: 'projects#user_projects', as: :user
    end
    resources :comments
  end
  resources :users, only: [:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'
end
