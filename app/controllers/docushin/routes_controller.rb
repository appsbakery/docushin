 class Docushin::RoutesController < ActionController::Base
  layout 'docushin'

  before_filter :load_resource
  before_filter :authorize_resource, :only => [:edit, :update]

  def index
  end

  def collections
    @content = File.read(File.join(Rails.root, "doc", "docushin", "collections.yml")) rescue nil
    @sets = YAML.load(@content)
  end

  def show
    @route = @route_set.find_by_filename_hash(params[:id])
  end

  def edit
    @route = @route_set.find_by_filename_hash(params[:id])
  end

  def update
    @route = @route_set.find_by_filename_hash(params[:id])
    @route.update_attributes(params[:route])
    redirect_to routes_path
  end

  private
  def load_resource
    @route_set = Docushin::RouteSet.new
  end

  def authorize_resource
    render :text => "Unauthorized" unless Rails.env.development?
  end
end