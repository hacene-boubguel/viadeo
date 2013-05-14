require "spec_helper"
describe Viadeo::Status do
  describe "#create (Post a status)" do
    subject do
      status = Viadeo::Status.new("access_token_test_3e8c55877482b2")
      VCR.use_cassette 'status/create' do
        status.create(message: "Viadeo API")
      end
    end

    include_examples "shared_create_graph_object", success=true
  end

end
