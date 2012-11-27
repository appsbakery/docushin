class Docushin::HomeController < ActionController::Base
  layout 'docushin'

  def index
    #get all the .md files(routes)
    #get their basename and return routes arranged
    @routes = []
    @routes_set = Docushin::RouteSet.new
    @documents = Dir["#{File.join(Rails.root, "doc/docushin")}/*.md"]
    @documents.collect {|r| @routes << @routes_set.find(File.basename(r, ".md"))}
    @routes.sort_by!(&:updated_at).reverse!.take(10)
  end
end
