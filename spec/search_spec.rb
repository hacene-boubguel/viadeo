require "spec_helper"
require "shared_graph_object"
describe Viadeo::Search do
  build = lambda do 
    search = Viadeo::Search.new("access_token_test_3e8c55877482b2", connection: "users")
    VCR.use_cassette 'search/find' do
      search.find(school: "paris", limit: 5)
    end
  end
  let(:limit) {5} 
  include_examples "shared_graph_object", graph_object = build.call
  it {graph_object.type.should be_eql("SEARCH FOR USERS") }
end
