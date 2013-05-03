require 'spec_helper'
describe Viadeo::User do
  before(:all) do
    @access_token = "access_token_test_3e8c55877482b2"
  end
 

  describe "#retrieve" do
    context "when object is not found" do
      before(:all) do
        id = "azerty"
        @user = Viadeo::User.new(@access_token, id: id)
        VCR.use_cassette 'user/retrieve_fail_response' do
          @user.retrieve
        end
      end

      let(:error_type) {"url not found, id error or unsupported method"}

      it "should return error message" do
        @user.error[:type].should be_eql(error_type)
      end
    end

    context "when object is founded" do
      before(:all) do
        @user = Viadeo::User.new(@access_token)
        VCR.use_cassette 'user/retrieve_success_response' do
          @user.retrieve
        end
      end

      subject { @user}

      [:id, :name, :language, :gender, :nickname].each do |attr| 
        it {should respond_to(attr) }
      end

      it {@user.type.should be_eql("USER") }
    end

    context "With all contacts" do
      before(:all) do
        @user = Viadeo::User.new(@access_token, connection: "contacts")
        VCR.use_cassette 'user/retrieve_with_contacts_response' do
          @user.retrieve(is_premium: true)
        end
      end

      subject { @user}

      [:id, :type, :name, :count, :paging, :data].each do |attr| 
        it {should respond_to(attr) }
      end

      it {@user.type.should be_eql("USER CONTACTS") }

    end

  end

  describe "#save" do
    before(:all) do
      id = "me"
      @user = Viadeo::User.new(@access_token, id: id)
      @user.interests = "---"
      VCR.use_cassette 'user/save_response' do
        @user.save
      end
    end

    subject {@user} 

    [:updated, :interests].each do |attr|
      it {should respond_to attr}
    end
  end

  describe "#update" do
    before(:all) do
      id = "me"
      @user = Viadeo::User.new(@access_token, id: id)
      VCR.use_cassette 'user/update_response' do
        @user.update(interests: "---")
      end
    end

    subject {@user} 
    it {should respond_to :updated}
  end

end
