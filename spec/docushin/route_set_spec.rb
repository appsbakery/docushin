require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Docushin::RouteSet do
  describe 'Build route set from routes' do
    let(:routes_collection) { Docushin::RouteSet.new }
    it 'should have attr_accessor routes that is an array' do
      routes_collection.routes.class.should == Array
    end
  end
end
