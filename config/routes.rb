Rails.application.routes.draw do
  
  get "notifications/index"
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }

  resources :posts do
    resources :likes, only: [:create, :index ] 
  end
 

  root "home#index"
  
  get "home/users" ,to: "home#all_user"
  get "home/my_profile" ,to: "home#user_profile"
  get "home" ,to: "home#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
end


