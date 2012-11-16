require 'digest/md5'

module Docushin
  class Route

    extend ActiveModel::Naming
    include ActiveModel::Conversion

    attr_accessor :name
    attr_accessor :verb
    attr_accessor :path
    attr_accessor :requirements
    attr_accessor :base
    attr_accessor :data
    attr_accessor :file_name
    attr_accessor :content
    attr_accessor :description
    
    def initialize(route)
      @base = File.join(Rails.root, 'doc', 'docushin')
      @name = route.name
      @verb = route.verb.source.empty? ? "MATCH" : route.verb.source.gsub(/[$^]/, '')
      @path = route.path.spec.to_s.sub('(.:format)', '')
      @requirements = route.requirements
      @file_name = Digest::MD5.hexdigest(@verb.to_s + @path)
      rtfm(@base, @file_name) if File.exists?(File.join(@base, @file_name)  + '.md')
    end

    def persisted?
      true
    end

    alias :id :file_name

    def rtfm(base, name)
      @content = File.read(File.join(base, name) + '.md')

      begin
        if @content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
          @content = $'
          @data = YAML.load($1)
          @description = @data['description']
        end
      rescue => e
        # puts "Exception reading #{name}: #{e.message}"
      end
      @data ||= {}
    end
  end
end