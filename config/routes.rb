Docushin::Engine.routes.draw do
  resources :routes, :except => :destroy
end