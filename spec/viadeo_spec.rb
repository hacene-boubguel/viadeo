require 'spec_helper'
describe Viadeo do
  it 'should return correct version string' do
    Viadeo.version_string.should == "Viadeo version #{Viadeo::VERSION}"
  end

  describe ".config" do
    before(:each) do
      @config = Viadeo.config
    end
    it { @config.should respond_to :logger }
  end
end
