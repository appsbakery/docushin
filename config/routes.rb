Docushin::Engine.routes.draw do
  resources :routes, :only => [:index, :show]
end