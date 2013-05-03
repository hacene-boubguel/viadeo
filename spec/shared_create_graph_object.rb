shared_examples "shared_create_graph_object" do |graph_object,success=false|

  subject {graph_object}

  if (success)
    [:created, :created_graph_id].each do |attr|
      it {should respond_to attr}
    end
  else
    let(:error_type) {"permission denied"}
    it "should return error message" do
      graph_object.error[:type].should be_eql(error_type)
    end
  end
end
