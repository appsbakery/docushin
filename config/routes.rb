Docushin::Engine.routes.draw do
  root :to => "home#index"
  resources :routes, :except => :destroy
  resources :collections, :except => :destroy
end
