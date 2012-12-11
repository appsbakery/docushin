module Docushin
  class CollectionsController < Docushin::ApplicationController
    before_filter :authorize!, :only => [:edit, :update, :destroy]
    before_filter :set_default_base_path, :load_route_set

    def index
      @content = YAML.load_documents(File.open(File.join(Rails.root, "doc", "docushin", "collections.yml"))) rescue nil
      @collections = @content.nil? ? [] : @content
    end

    def show
    end

    def new
    end

    def edit
    end

    def destroy
      @content = YAML.load_documents(File.open(File.join(Rails.root, "doc", "docushin", "collections.yml"))) rescue nil
      @content.reject! {|obj| obj[:id] == params[:id]}
      File.open(File.join(set_default_base_path,"collections.yml"), "w") do |file|
        @content.each do|item|
          file.write item.to_yaml
        end
        file.close
      end
      redirect_to collections_path
    end

    def create
      params[:title] =  params[:title].blank? ? "Default Title" : params[:title]
      @data = {:id => Digest::MD5.hexdigest(DateTime.now.to_s), :title => params[:title], :route_set_ids => params[:route_set_ids] }
      FileUtils.mkdir_p(set_default_base_path) unless File.exists?(set_default_base_path)
      File.open(File.join(set_default_base_path,"collections.yml"), "a+") do |file|
        file.write @data.to_yaml
        file.close
      end
    end
  end
end
