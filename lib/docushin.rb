require "docushin/route"
require "docushin/engine"
require "docushin/version"
require "docushin/route_set"

module Docushin
  mattr_accessor :path_regexp
  @@path_regexp = /./
  
  def self.setup
    yield self
  end
end
