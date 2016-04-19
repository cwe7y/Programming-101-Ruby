Rails.application.routes.draw do
  get 'brands/', to: 'brands#index'
  get 'brands/count', to: 'brands#count'
  get 'brands/:index', to: 'brands#show'
  get 'brands/range/:index', to: 'brands#range'
  get 'brands/range/:index/:count', to: 'brands#from'

  post 'brands/new', to: 'brands#create'
  put 'brands/:index', to: 'brands#update'
  delete 'brands/:index', to: 'brands#destroy'
  
  get 'categories/count', to: 'categories#count'
  get 'categories/:index', to: 'categories#show'
  get 'categories/range/:index', to: 'categories#range'
  get 'categories/range/:idex/:count', to: 'categories#from'
  get 'categories/', to: 'categories#index'

  post 'categories/new', to: 'categories#create'
  put 'categories/:index', to: 'categories#update'
  delete 'categories/:index', to: 'categories#destroy'

  get 'products/count', to: 'products#count'
  get 'products/:index', to: 'products#show'
  get 'products/range/:index', to: 'products#range'
  get 'products/range/:idex/:count', to: 'products#from'
  get 'products/', to: 'products#index'

  post 'products/new', to: 'products#create'
  put 'products/:index', to: 'products#update'
  delete 'products/:index', to: 'products#destroy'

  get 'search/:type/:slug', to: 'searches#filter'
  get 'search/:type/:property/:slug', to: 'searches#filter_by'


 


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
