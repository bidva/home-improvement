Rails.application.routes.draw do
  
  get 'static_pages/home'
  get 'static_pages/about'

  devise_for :users, 
  	:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :projects do
    collection do
      get '/user_projects', to: 'projects#user_projects', as: :user
    end
    resources :comments
  end
  resources :users, only: [:update, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'
end
