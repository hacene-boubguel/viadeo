shared_examples "shared_graph_object" do |limit|

  [:count, :count_string, :data, :id, :link, :name, :paging, :type, :updated_time].each do |attr|
    it {subject.should respond_to attr}
  end

  it "should have data array with #{limit} size passed on parameter" do
    subject.data.size.should be <= limit
  end
end
