Rails.application.routes.draw do
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }

  root "home#index"
  resources :posts
  get "home/users" ,to: "home#all_user"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
end
