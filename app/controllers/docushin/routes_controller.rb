class Docushin::RoutesController < ActionController::Base
  layout 'docushin'
  before_filter :load_route_set

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
    #create the directory if it doesnt exists
    FileUtils.mkdir_p(@path) unless File.exists?(@path)

    File.open(File.join(@path, @route.file_name) + ".md", "w+") do |file|
      file.write "---\n"
      file.write "description: " + params[:route][:description] + "\n"
      file.write "---\n"
      file.write params[:route][:content]
      file.close
    end
    redirect_to routes_path
  end

  private
  def load_route_set
    @routes_collection = Docushin::RouteSet.new 
    @path = File.join(Rails.root, 'doc', 'docushin')
  end
end