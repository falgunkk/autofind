Rails.application.routes.draw do
  
  root to:'home#index'
  devise_for :users
  mount Resque::Server.new, :at => "/resque"
  get 'send_email', to: 'home#send_email_to_mechanic'
  get 'set_active_job', to: 'home#set_active_job'
  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

end
