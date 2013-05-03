require "spec_helper"
require "shared_graph_object"
describe Viadeo::Newsfeed do
  build = lambda do
    newsfeed = Viadeo::Newsfeed.new("access_token_test_3e8c55877482b2")
    VCR.use_cassette 'newsfeed/retrieve' do
      newsfeed.retrieve(limit: 5)
    end
  end
  let(:limit) {5}
  include_examples "shared_graph_object", graph_object = build.call
  it {graph_object.type.should be_eql("USER NEWS") }
end
