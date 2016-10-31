Rails.application.routes.draw do
  resources :comments
  resources :users
  root 'translations#index'

  resources :translations
  resources :vwords
  resources :gwords do
      end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
