Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show, :edit, :update] do
    resources :tasks
  end
  resources :resources, only: [:index, :new, :create, :show, :edit, :update] 
  root to: 'home#index'
end
