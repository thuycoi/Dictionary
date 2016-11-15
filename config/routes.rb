Rails.application.routes.draw do
get 'signup' => 'users#new', :as =>'signup'
get 'login' => 'sessions#new', :as =>'login'
get 'logout' => 'sessions#delete', :as => 'logout'

  resources :sessions
  resources :users
  resources :comments

  
  root 'translations#index'

  resources :translations do
    resources :gwords
  end
  resources :vwords
  resources :gwords do
    resources :comments
      end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
