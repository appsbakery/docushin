require "docushin/route"
require "docushin/engine"
require "docushin/version"
require "docushin/route_set"

module Docushin
  mattr_accessor :path_regexp
  @@path_regexp = nil

  mattr_accessor :data_fields
  @@data_fields = [:description]

  def self.setup
    yield self
  end
end
