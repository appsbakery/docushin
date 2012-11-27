module Docushin
  class RouteSet
    attr_accessor :routes

    def initialize
      @routes = []
      Rails.application.routes.routes.each do |route|
        # next if route.app.is_a?(ActionDispatch::Routing::Mapper::Constraints)
        next if route.app.is_a?(Sprockets::Environment)
        next if route.app == Docushin::Engine

        if (rack_app = discover_rack_app(route.app)) && rack_app.respond_to?(:routes)
          rack_app.routes.routes.each do |rack_route|
            add_route Route.new(rack_route)
          end
        end

        add_route Route.new(route)
      end
    end

    def add_route(route)
      if Docushin.path_regexp.nil?
        @routes << route
      else
        @routes << route if route.path.match(Docushin.path_regexp)
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

    def find(hash)
      @routes.each do |route|
        return route if route.id == hash
      end
      nil
    end
  end
end
