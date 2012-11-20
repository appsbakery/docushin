Docushin::Engine.routes.draw do
  root :to => "home#index"
  resources :routes, :except => :destroy do
    get :collections, :on => :collection
  end
end