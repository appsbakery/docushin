module Docushin
  class RouteSet
    attr_accessor :routes
    
    def initialize
      @routes = []
      Rails.application.routes.routes.each do |route|
        next if route.app.is_a?(ActionDispatch::Routing::Mapper::Constraints)
        next if route.app.is_a?(Sprockets::Environment)
        next if route.app == Docushin::Engine

        if (rack_app = discover_rack_app(route.app)) && rack_app.respond_to?(:routes)
          rack_app.routes.routes.each do |rack_route|
            docushin_route = Route.new(rack_route)
            @routes << docushin_route if docushin_route.path.match(Docushin.path_regexp)
          end
        end
        
        docushin_route = Route.new(route)
        @routes << docushin_route if docushin_route.path.match(Docushin.path_regexp)
      end
    end

    def discover_rack_app(app)
      class_name = app.class.name.to_s
      if class_name == "ActionDispatch::Routing::Mapper::Constraints"
        discover_rack_app(app.app)
      elsif class_name !~ /^ActionDispatch::Routing/
        app
      end
    end

    def find_by_filename_hash(hash)
      @routes.each do |route|
        return route if route.file_name == "#{hash}"
      end
    end
  end
end