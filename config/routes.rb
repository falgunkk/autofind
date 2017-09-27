Rails.application.routes.draw do
  
  root to:'home#index'
  devise_for :users

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

end
