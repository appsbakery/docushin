class Docushin::HomeController < ActionController::Base
  layout 'docushin'

  def index
    @index = File.read(File.join(Rails.root, "doc", "docushin", "index.md")) rescue nil
  end
end
