Rails.application.routes.draw do
  get 'ajax/users'

  get 'home/index'

 

  resources :journeys do
      post 'close'
      post 'open'
    resources :passengers do
      post  'accept'
      post 'reject'
    end
    resources :drivers
    resources :payment_transactions
  end
  
  resources :feedback, only: [] do
    collection do
        get 'new/:target/:id', :to => "feedbacks#new", :as => 'new'
        post '/:target/:id', :to => "feedbacks#create", :as => 'create'
      end
  end

    resources :cars
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]
  resources :conversations, only: [:index, :show, :destroy] do
      member do
        post :reply
        post :restore
        post :mark_as_read
      end
      collection do
        delete :empty_trash
      end
    end
  resources :messages, only: [:new, :create]
  
  root to: "home#index"
  # get 'welcome' => 'home#welcome'
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
  #   0 :toggleable do
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
