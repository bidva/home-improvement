Rails.application.routes.draw do
  resources :comments
  devise_for :users, 
  	:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'

end
