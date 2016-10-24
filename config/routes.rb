Rails.application.routes.draw do
  resources :vwords
  resources :gwords
  resources :entries

  root 'entries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
