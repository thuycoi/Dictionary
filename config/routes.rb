Rails.application.routes.draw do
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
