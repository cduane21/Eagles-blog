Rails.application.routes.draw do
  get '/' => "home#index"
  post '/login' => "home#login"
  get '/logout' => "home#logout"
  get '/new_user' => "users#new_user"
  get '/post' => "posts#post"
  put '/posts/:id(.:format)' => "posts#update"
  put '/update' => "posts#update"
  get '/delete/:id(.:format)' => "posts#destroy"
  get '/comment/:id(.:format)/' => "posts#comment"
  post '/comment/:id(.:format)/' => "posts#make_comment"
  get '/index' => "posts#index"
  get '/edit' => "comments#edit"
  get '/delete_comment/:id(.:format)' => "comments#destroy"
  get '/sign_out' => "reset#sign_out"
  post '/make_post' => "posts#make_post"

  get 'user' => "users#index"
  get '/delete_user/:id(.:format)' => "users#destroy"
  
  resources :users
  resources :posts
  resources :comments

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
