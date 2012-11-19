class Docushin::RoutesController < ActionController::Base
  layout 'docushin'
  before_filter :load_route_set
  before_filter :restrict_to_development, :only => [:edit, :update]
  def index
  end

  def show
    @route = @routes_collection.find_by_filename_hash(params[:id])
  end

  def edit
    @route = @routes_collection.find_by_filename_hash(params[:id])
  end

  def update
    @route = @routes_collection.find_by_filename_hash(params[:id])
    @route.update_attributes(params[:route])
    redirect_to routes_path
  end

  private
  def load_route_set
    @routes_collection = Docushin::RouteSet.new
  end

  def restrict_to_development
    head(:bad_request) unless Rails.env.development?
  end
end