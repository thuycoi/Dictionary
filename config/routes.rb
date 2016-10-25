Rails.application.routes.draw do
 root 'translations#index'

  resources :translations
  resources :vwords
  resources :gwords
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
