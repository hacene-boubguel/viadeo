module Viadeo 
  # == List of actions
  # * find : Also aliased as : retrieve, get (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/user#GET_user_id]
  # * update : Also aliased as put : (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/user#POST_user_id]
  # == Examples :
  #  require "viadeo"
  #  
  #  # Retrieve information from a Viadeo member’s profile. An access to another user profile will count a new visit
  #  user = Viadeo::User.new(access_token)
  #  user.retrieve
  #
  #  # Update user information
  #  user.update(country: "France")
  #  # Alternative
  #  user.country = "France"
  #  user.save
  #
  # == List of connections
  # * contacts (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/user/ID/contacts/&domains=,Entry%20points] 
  # * ... (more)[http://dev.viadeo.com/graph-api-resource/?resource=%2Fuser%2F&domains=%2CEntry%20points#connections]
  # == Examples :
  #  require "viadeo"
  #
  #  # Retrieve a list of all a member’s premium contacts.
  #  user = Viadeo::User.new(access_token, connection: "contacts")
  #  user.retrieve(is_premium: true)



  class User < GraphConnection
    include Viadeo::Operations::Get
    include Viadeo::Operations::Create
    include Viadeo::Operations::Update
   
    protected
    def url
      id_or_me = @id.nil? ? "me" : @id 
      @connection.nil? ? id_or_me : "#{id_or_me}/#{@connection}"
    end
  end
end
