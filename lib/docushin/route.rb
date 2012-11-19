require 'digest/md5'
require 'active_support/core_ext/hash/indifferent_access'

module Docushin
  class Route

    extend ActiveModel::Naming
    include ActiveModel::Conversion

    attr_accessor :name
    attr_accessor :verb
    attr_accessor :path
    attr_accessor :controller
    attr_accessor :requirements
    attr_accessor :base
    attr_accessor :data
    attr_accessor :file_name
    attr_accessor :content

    alias :id :file_name

    def initialize(route)
      @controller = route.defaults[:controller]
      @base = File.join(Rails.root, 'doc', 'docushin')
      @name = route.name
      @verb = route.verb.source.empty? ? "MATCH" : route.verb.source.gsub(/[$^]/, '')
      @path = route.path.spec.to_s.sub('(.:format)', '')
      @requirements = route.requirements
      @file_name = Digest::MD5.hexdigest(@verb.to_s + @path)
      rtfm(@base, @file_name) if File.exists?(File.join(@base, @file_name)  + '.md')
    end

    def description
      @data["description"]
    end

    # Updates the attributes of the model from the passed-in hash
    # and saves the route
    def update_attributes(attributes)
      attributes.to_hash
      self.attributes = attributes
      self.save
    end

    def attributes=(attributes)
      attributes = attributes.with_indifferent_access.to_hash
      @content = attributes.delete("content")
      @data = attributes
    end

    # Saves the route
    #
    # If the route is new, a document gets created in the doc folder, otherwise
    # the existing document gets updated.
    def save
      @data["updated_at"] = DateTime.now.to_i
      FileUtils.mkdir_p(@base) unless File.exists?(@base)
      File.open(File.join(@base,"#{@file_name}.md"), "w+") do |file|
        file.write @data.to_yaml
        file.write "---\n"
        file.write @content
        file.close
      end
    end

    def persisted?
      true
    end

    # Read route's documentation
    def rtfm(base, name)
      @content = File.read(File.join(base, name) + '.md')

      begin
        if @content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
          @content = $'
          @data = YAML.load($1)
        end
      rescue => e
        # puts "Exception reading #{name}: #{e.message}"
      end
      @data ||= {}
    end
  end
end