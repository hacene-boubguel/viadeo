require "spec_helper"
describe Viadeo::ReferenceData do
  limit = 5
  subject do 
    reference_data = Viadeo::ReferenceData.new("access_token_test_3e8c55877482b2", resource: "language")
    VCR.use_cassette 'reference_data/all' do
      reference_data.all(limit: limit)
    end
  end
  include_examples "shared_graph_object", limit
  it {subject.type.should be_eql("LANGUAGES") }
end
