Rails.application.routes.draw do
  root "pages#home"

  resources :menus do
    resources :items, only: [ :show ]
  end

  resources :items do
    post "add_to_cart", on: :member
    post "update_cart", on: :member
    collection do
      post "complete_order"
      get "checkout"
    end
  end
  post "/items/:id/add_to_cart", to: "items#add_to_cart", as: "add_to_cart"
  get "/cart", to: "items#show_cart", as: "show_cart"
  patch "/cart/:id", to: "items#update_cart", as: "update_cart"
  delete "/cart/:id", to: "items#remove_from_cart", as: "remove_from_cart"
  get "/checkout", to: "items#checkout", as: "checkout"
  post "complete_order", to: "items#complete_order", as: "complete_order"
  get "about", to: "pages#about"
  get "sources", to: "pages#sources"

  resources :reservations



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
