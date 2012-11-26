class Docushin::CollectionsController < ActionController::Base
  layout 'docushin'

  def index
    @content = File.read(File.join(Rails.root, "doc", "docushin", "collections.yml")) rescue nil
    @sets = @content.nil? ? [] : YAML.load(@content)
  end
end
