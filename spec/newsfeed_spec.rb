require "spec_helper"
describe Viadeo::Newsfeed do
  limit = 5
  subject do 
    newsfeed = Viadeo::Newsfeed.new("access_token_test_3e8c55877482b2")
    VCR.use_cassette 'newsfeed/retrieve' do
      newsfeed.retrieve(limit: 5)
    end
  end
  include_examples "shared_graph_object", limit
  it {subject.type.should be_eql("USER NEWS") }
end
