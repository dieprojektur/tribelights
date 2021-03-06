TribeLights::Application.routes.draw do |map|


  match "/images/uploads/*path" => "gridfs#serve"

  resource :user, :only => [] 

  resource :profile

  resources :welcome, :only => [:index]
  resources :public_profiles, :only => [:index, :search] do
    collection do
      post :search
    end
    member do
      post :friend
    end
  end
  devise_for :users

  get "welcome/index"

  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
