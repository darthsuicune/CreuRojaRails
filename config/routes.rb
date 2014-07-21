CreuRoja::Application.routes.draw do
	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"
	root 'static_pages#map'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
	
	#Regular routes
	get '/home' => 'static_pages#home'
	get '/contact' => 'static_pages#contact'
	get '/about' => 'static_pages#about'
	get '/signin' => 'sessions#new'
	get '/login' => 'sessions#new'
	get '/signout' => 'sessions#destroy'
	get '/logout' => 'sessions#destroy'
	get '/map' => 'static_pages#map'
	post '/users/:id' => 'users#activate'

	#Resource routes (maps HTTP verbs to controller actions automatically):
	resources :users
	resources :sessions, only: [:new, :create, :destroy]
	resources :services
	resources :vehicles
	resources :locations
	resources :vehicle_services, only: [:create, :update, :destroy]
	resources :location_users, only: [:create, :update, :destroy]
	resources :issues
	resources :password_reset, only: [:new, :create, :edit, :update]

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
