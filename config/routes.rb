MobileSearch::Application.routes.draw do
  match 'api/app_by_id' => 'api#app_by_id'
  match 'api/app_all' => 'api#app_all'
  match 'api/app_by_recommendation' => 'api#app_by_recommendation'
  match 'api/user_by_id' => 'api#user_by_id'
  match 'api/user_all' => 'api#user_all'
  match 'api/friend_by_user_id' => 'api#friend_by_user_id'
  match 'api/profile_by_user_id' => 'api#profile_by_user_id'
  match 'api/profile_update_by_user_id' => 'api#profile_update_by_user_id'
  match 'api/user_app_list_by_user_id' => 'api#user_app_list_by_user_id'
  match 'api/app_search_by_keyword' => 'api#app_search_by_keyword'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
