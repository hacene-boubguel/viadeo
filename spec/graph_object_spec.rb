require 'spec_helper'

describe Viadeo::GraphObject do
  describe ".initialize" do
    before(:all) do
      access_token = "access_token_test_3e8c55877482b2"
      id = "azertyazerty"
      @graph_object = Viadeo::GraphObject.new(access_token, id: id)
    end

    subject { @graph_object }

    [:id, :access_token, :updated?].each do |e| 
      it { should respond_to e}
    end

    [:id=, :access_token=].each do |e| 
      it { should_not respond_to e}
    end


    it "should not have updated attributes" do
      @graph_object.updated?.should be_false
    end
  
    it "should raise MissingAccessTokenError when access_token is not given" do
      expect { Viadeo::GraphObject.new(nil) }.to raise_error(Viadeo::MissingAccessTokenError)
    end

    describe "initialize variable name = 'Dupond'" do
      before :each do
        @graph_object.name="Dupond"
      end

      it { should respond_to :name}

      it "should include 'name' variable in keys" do
        @graph_object.keys.include?(:name).should be_true
      end

      it "should include 'Dupond' in values" do
        @graph_object.keys.include?(:name).should be_true
      end

      it "should mark 'name' variable as updated attribute" do
        @graph_object.updated?(:name).should be_true
      end

      it "should mark object as updated" do
        @graph_object.updated?.should be_true
      end
    end
  end

  describe ".new_from" do
    before(:all) do
      access_token = "access_token_test_3e8c55877482b2"
      data = { id: "azertyazerty", name: "dupond", email: "dupond@example.com"}
      @graph_object = Viadeo::GraphObject.new_from(data, access_token)
    end

    subject { @graph_object }

    [:id, :access_token, :updated?, :name, :name=, :email, :email=].each do |e| 
      it { should respond_to e}
    end

    it "should not have updated attributes" do
      @graph_object.updated?.should be_false
    end

    it "should raise NoMethodError exception when we call an unknown method" do
      lambda {@graph_object.unknown_method }.should raise_exception(NoMethodError)  
    end

    describe "update attribute : name = 'Durond'" do
      before :all do
        @graph_object.name="Durond"
      end

      it "should mark object as updated" do
        @graph_object.updated?.should be_true
      end
     
      it "should mark 'name' attribute as updated" do
        @graph_object.updated?(:name).should be_true
      end

      it "should not mark 'email' attribute as updated" do
        @graph_object.updated?(:email).should be_false
      end
    end
  end


  describe "Utils methods" do
    before(:all) do
      access_token = "access_token_test_3e8c55877482b2"
      @data = { id: "azertyazerty", name: "dupond", email: "dupond@example.com"}
      @graph_object = Viadeo::GraphObject.new_from(@data, access_token)
    end

    describe "#to_s" do
      it "should dump attributes on pretty multijson format" do
        @graph_object.to_s.should be_eql(MultiJson.dump(@data,pretty: true))
      end
    end

    describe "#to_hash" do
      it "should return a hash of given data" do
        @graph_object.to_hash.should be_eql(@data)
      end
    end

    describe "#[]" do
      it "should create method whith the same name as key added to the graph object" do
        @graph_object[:first_name]="First name"
        @graph_object.should respond_to(:first_name)
        @graph_object[:first_name].should be_eql("First name")
      end
    end

    describe "#reset" do
      before(:each) do
        access_token = "access_token_test_3e8c55877482b2"
        @data = { id: "azertyazerty", name: "dupond", email: "dupond@example.com"}
        @graph_object = Viadeo::GraphObject.new_from(@data, access_token)
      end

      it "should return false for updated? method and reset all values and keys" do
        @graph_object.updated?.should be_false 
        @graph_object.name = "durond" 
        @graph_object.updated?.should be_true 
        @graph_object.reset 
        @graph_object.updated?.should be_false
        @graph_object.keys.should be_empty
        @graph_object.values.should be_empty
      end
    end
  end
end
