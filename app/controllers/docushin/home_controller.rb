class Docushin::HomeController < ActionController::Base
  layout 'docushin'

  def index
    #get all the .md files(routes)
    #get their basename and return routes arranged
    @routes_set = Docushin::RouteSet.new
    @routes = Dir["#{File.join(Rails.root, "doc/docushin")}/*.md"].collect do |file|
      @routes_set.find(File.basename(file, ".md"))
    end
    @routes = @routes.compact.sort_by(&:updated_at).reverse.take(10)
  end
end
