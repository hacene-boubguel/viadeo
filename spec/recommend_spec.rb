require "spec_helper"
require "shared_graph_object"
require "shared_create_graph_object"
describe Viadeo::Recommend do
  describe "#retrive (Retrieve recommended URL infos.)" do
    build = lambda do
      recommend = Viadeo::Recommend.new("access_token_test_3e8c55877482b2")
      VCR.use_cassette 'recommend/retrieve' do
        recommend.retrieve(url: "http://dev.viadeo.com", limit: 5)
      end
    end
    let(:limit) {5} 
    include_examples "shared_graph_object", graph_object = build.call
    it {graph_object.type.should be_eql("RECOMMEND DETAILS") }
  end
  describe "#create (Recommend a new URL)" do
    build = lambda do
      recommend = Viadeo::Recommend.new("access_token_test_3e8c55877482b2")
      VCR.use_cassette 'recommend/create' do
        recommend.create(url: "http://dev.viadeo.com", title: "Get started with the Viadeo API")
      end
    end
    include_examples "shared_create_graph_object", graph_object = build.call
  end

end
