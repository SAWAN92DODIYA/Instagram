Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "home#index"
  get "saved_posts/index"

  resources :notifications ,only: [:index]
  
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :posts do
    resources :comments, only: [:index, :create,:destroy]
    resources :likes, only: [:create, :index ] 
    resource :saved_posts,  only: [:create,:destroy]
  end

 
 
  resources :users, only: [:index, :show] do
    resources :follows, only: [] do
      collection do
        get :all_followers
        get :all_followed
        post :create_followed
        delete :destroy_followed
      end
    end
  end

  resources :conversations,only: [:index, :new, :create] do
    resources :messages ,only: [:index, :create]
   end
  

  

  
  get "search/users" ,to: "home#search_user"
  
  
  get "home/my_profile" ,to: "home#user_profile"
  get "home" ,to: "home#index"
  

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
end


