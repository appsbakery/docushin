require "docushin/version"
require "docushin/route"
require "docushin/engine"
require "docushin/route_set"
require "rails/routes"

module Docushin
  def self.version
    "Docushin version #{Docushin::VERSION}"
  end
end
