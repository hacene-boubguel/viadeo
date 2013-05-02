require 'spec_helper'
describe Viadeo do
  it 'should return correct version string' do
    Viadeo.version_string.should == "Viadeo version #{Viadeo::VERSION}"
  end
end
