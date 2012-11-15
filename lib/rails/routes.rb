module ActionDispatch::Routing
  class Mapper
    def mount_docushin
      namespace :docushin do
        resources :routes, :only => [:index, :show]
      end
    end
  end
end