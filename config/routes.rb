HuskyGamify::Application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "users/new"
  get "users/show"
  get "generic_pages/home"
  get "generic_pages/about"
  get "generic_pages/faq"

  root 'generic_pages#home'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :user_profile
  resources :events
  resources :attendings
  resources :microposts

  match '/register', to:'users#new', via:'get'
  match '/login',to:'sessions#new',  via:'get'
  match '/logout',to:'sessions#destroy',  via:'delete'
  match '/about', to:'generic_pages#about', via:'get'
  match '/faq', to:'generic_pages#faq', via:'get'
  match '/create_profile', to:'user_profile#new', via:'get'
  match '/events', to: 'events#index', via:'get'
  match '/feed', to:'generic_pages#logged_in_home', via:'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
