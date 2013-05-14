require "spec_helper"
describe Viadeo::Search do
  limit = 5
  subject do
    search = Viadeo::Search.new("access_token_test_3e8c55877482b2", connection: "users")
    VCR.use_cassette 'search/find' do
      search.find(school: "paris", limit: limit)
    end
  end
  include_examples "shared_graph_object", limit
  it {subject.type.should be_eql("SEARCH FOR USERS") }
end
