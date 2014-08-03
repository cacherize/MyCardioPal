MyCardioPal::Application.routes.draw do
  resources :faq, only: [:index, :new, :create, :edit, :update]

  resources :support_tickets, only: [:index, :new, :create]
  get 'add_workout', to: 'workouts#new'
  resources :workouts
  resources :activities
  match 'reset_password', to: 'password_resets#new', via: :get
  match 'reset_password/:id/edit', to: 'password_resets#edit', via: :get, as: 'edit_password'
  resources :password_resets, only: [:new, :create, :edit, :update]
  match 'login', to: 'sessions#new', via: :get
  match 'logout', to: 'sessions#destroy', via: :delete
  resources :sessions, only: [:destroy, :new, :create]
  match 'sign_up', to: 'users#new', via: :get
  match 'profile', to: 'users#show', via: :get
  resources :users do
    member do
      get 'confirm'
    end
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  match 'under_development', to: 'under_development#index', via: :get
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
