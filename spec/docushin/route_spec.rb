require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Docushin::Route do
  let(:route_set) { Docushin::RouteSet.new }
  let(:route) { route_set.routes.first }

  describe 'create a new Route' do
    it 'should have name, verb, path, requirements, data, content as attr' do
      route.should respond_to(:name)
      route.should respond_to(:verb)
      route.should respond_to(:path)
      route.should respond_to(:requirements)
      route.should respond_to(:updated_at)
      route.should respond_to(:base)
      route.should respond_to(:data)
      route.should respond_to(:file_name)
      route.should respond_to(:content)
      route.should respond_to(:description)
      route.should respond_to(:updated_at)
    end
  end

  describe 'inspect the new Route' do
    it 'should have attr defined' do
      route.base.should == File.join(Rails.root, 'doc', 'docushin')
      route.file_name.should == Digest::MD5.hexdigest(route.verb.to_s + route.path)
      route.name.should == "foo_index"
      route.path.should == "/foo"
      route.requirements.should == {:action=>"index", :controller=>"foo"}
      route.verb.should == "GET"
    end
  end

  describe 'read markdown file' do
    it 'should generate data and content' do
      route.description.should == "I am so awesome"
      route.content.should == "{\"id\":\"4f3a296ac8de6732fe000003\",\"first_name\":\"Todor\",\"last_name\":\"Grudev\",\"gender\":\"male\",\"email\":\"tagrudev@gmail.com\"}\n"
    end
  end
  describe 'update markdown file' do
    it 'should update specified attributes' do
      route.save
      route.updated_at.should == File.mtime(File.join(route.base, "#{route.file_name}.md")).to_i
    end
  end
end
