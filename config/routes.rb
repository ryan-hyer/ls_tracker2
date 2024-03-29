LsTracker2::Application.routes.draw do

  resources :clients do
    resources :facilities, shallow: true, except: [:index, :show] do
      resources :inspections, only: [:new, :create]
    end
    resources :listings, shallow: true, except: [:index, :show]
    resources :amendments, shallow: true, except: [:index, :show]
  end

  resources :facilities, only: :index
  put 'facilities/:id/geocache' => 'facilities#geocache'
  resources :invoices, except: :show
  get 'invoices/:id/quickpay' => 'invoices#quickpay', as: :quickpay
  resources :standards
  resources :categories
  resources :schemes, except: :show
  resources :tests, except: [:index, :show]
  resources :inspections, except: [:new, :create]

  devise_for :users, :path_prefix => 'my'
  resources :users

  root "static_pages#home"

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
