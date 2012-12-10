module Docushin
  class HomeController < Docushin::ApplicationController
    before_filter :load_route_set

    def index
      @routes = Dir["#{File.join(Rails.root, "doc/docushin")}/*.md"].collect do |file|
        @route_set.find(File.basename(file, ".md"))
      end
      @routes = @routes.compact.sort_by(&:updated_at).reverse.take(10)
    end
  end
end
