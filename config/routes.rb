Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :payforms, only: [:index, :edit, :new, :create, :update, :show, :destroy]
  resources :areas, only: [:index, :edit, :new, :create, :update, :show, :destroy]
  resources :outlays, only: [:index, :edit, :new, :create, :update, :show, :destroy]

  resources :payforms do
  	resources :outlays
  end

  resources :areas do
  	resources :outlays
  end

  match 'relatorio', controller: 'outlays', action: 'relatorio', via: 'get'

  root "outlays#index"
end
