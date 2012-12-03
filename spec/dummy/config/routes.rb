Rails.application.routes.draw do
  mount Docushin::Engine, :at =>"docushin"
  resources :foo
  resources :bar
end
