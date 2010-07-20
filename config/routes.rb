TribeLights::Application.routes.draw do |map|



  resource :user, :only => [] do
  end
  resource :profile

  resources :welcome, :only => [:index]
  resources :public_profiles, :only => [:index]
  devise_for :users

  get "welcome/index"

  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
