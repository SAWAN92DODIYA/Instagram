Rails.application.routes.draw do
  
  
  get "comments/show"
  get "comments/edit"
  get "comments/update"
  get "comments/destroy"
  
  get "notifications/index"
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }

  resources :posts do
    resources :comments, only: [:index, :create]
    resources :likes, only: [:create, :index ] 
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
  

  root "home#index"
  get "search/users" ,to: "home#search_user"
  
  get "home/users" ,to: "home#all_user"
  get "home/my_profile" ,to: "home#user_profile"
  get "home" ,to: "home#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
end


