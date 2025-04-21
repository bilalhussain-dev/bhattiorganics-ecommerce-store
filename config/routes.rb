Rails.application.routes.draw do
  get 'dashboard/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#index"

  resources :products do
    member do
      get 'edit_seo'   # Route to edit SEO
      patch 'update_seo'  # Route to update SEO
    end
  end

  get "about",to: "pages#about", as: :about_page
  resources :categories, only: [:index, :create]

  # Manage SEO of Products



  # Dashboard
  get "dashboard", to: "dashboard#index"
end
