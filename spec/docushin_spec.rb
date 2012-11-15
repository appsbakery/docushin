require 'spec_helper'

describe Docushin do

  it 'should return correct version string' do 
    Docushin.version.should == "Docushin version #{Docushin::VERSION}"
  end

end