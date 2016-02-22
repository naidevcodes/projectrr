Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show, :edit, :update] do
    resources :tasks
  end
  root to: 'home#index'
end