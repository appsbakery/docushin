module Docushin
  module ApplicationHelper
    def generate_name(verb, path)
      return Digest::MD5.hexdigest(verb + path)
    end
    def file_exists?(verb, path)
      File.exists?(File.join(Rails.root, 'doc', 'docushin', generate_name(verb, path)) + '.md')
    end
  end
end