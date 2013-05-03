require "spec_helper"
require "shared_graph_object"
describe Viadeo::ReferenceData do
  build = lambda do
    reference_data = Viadeo::ReferenceData.new("access_token_test_3e8c55877482b2", resource: "language")
    VCR.use_cassette 'reference_data/all' do
      reference_data.all(limit: 5)
    end
  end
  let(:limit) {5} 
  include_examples "shared_graph_object", graph_object = build.call
  it {graph_object.type.should be_eql("LANGUAGES") }
end
