require 'spec_helper'
describe Viadeo::Util do
  describe ".convert_to_graph_object" do
    context "Hash data given" do
      before :each do
        access_token = "14a70e8b62746c714273763029892b87"
        data = { id: "azertyazerty", name: "dupond", email: "dupond@example.com"}
        @graph_object = Viadeo::Util.convert_to_graph_object(data, access_token)
      end
      it {@graph_object.should be_kind_of(Viadeo::GraphObject)}
    end

    context "Array data given" do
      before :all do
        access_token = "14a70e8b62746c714273763029892b87"
        data = [{ id: "dupond_id1", name: "dupond1", email: "dupond1@example.com"},
                { id: "dupond_id2", name: "dupond2", email: "dupond2@example.com"},
                { id: "dupond_id3", name: "dupond3", email: "dupond3@example.com"}]
        @graph_objects = Viadeo::Util.convert_to_graph_object(data, access_token)
      end

      it {@graph_objects.should be_kind_of(Array)}

      it "should return array of GraphObject object" do
        @graph_objects.each do |graph_object| 
          graph_object.should be_kind_of(Viadeo::GraphObject)
        end
      end
    end
  end
end
