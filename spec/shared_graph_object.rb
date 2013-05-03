shared_examples "shared_graph_object" do |graph_object|

  subject {graph_object}

  [:count, :count_string, :data, :id, :link, :name, :paging, :type, :updated_time].each do |attr|
    it {should respond_to attr}
  end

  it "should have data array with limit size passed on parameter" do
    graph_object.data.size.should be <= limit
  end
end
