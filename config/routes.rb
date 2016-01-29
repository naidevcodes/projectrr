Rails.application.routes.draw do
  resources :projects, only: [:index]
  root to: 'home#index'  # controller#method
end

# Routes read top to bottom
