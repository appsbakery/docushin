class Docushin::RoutesController < ActionController::Base
  def index
    @routes_collection = Docushin::RouteSet.new 
  end

  def show
    render :text => "Docushin#show"
  end
end