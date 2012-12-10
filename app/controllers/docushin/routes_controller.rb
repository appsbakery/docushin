module Docushin
  class RoutesController < ApplicationController
    before_filter :load_route_set
    before_filter :authorize!, :only => [:edit, :update]

    def index
    end

    def show
      @route = @route_set.find(params[:id])
    end

    def edit
      @route = @route_set.find(params[:id])
    end

    def update
      @route = @route_set.find(params[:id])
      @route.update_attributes(params[:route])
      redirect_to routes_path
    end
  end
end
