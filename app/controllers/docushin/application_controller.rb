module Docushin
  class ApplicationController < ActionController::Base
    layout "docushin"

    private
    def authorize!
      render :text => "Unauthorized" unless Rails.env.development?
      return false
    end

    def load_route_set
      @route_set = Docushin::RouteSet.new
    end

    def set_default_base_path
      File.join(Rails.root, 'doc', 'docushin')
    end
  end
end