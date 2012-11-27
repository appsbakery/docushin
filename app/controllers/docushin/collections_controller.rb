class Docushin::CollectionsController < ActionController::Base
  layout 'docushin'

  def index
    @route_set = Docushin::RouteSet.new
    @content = File.read(File.join(Rails.root, "doc", "docushin", "collections.yml")) rescue nil
    @sets = @content.nil? ? [] : YAML.load(@content)
  end
end
