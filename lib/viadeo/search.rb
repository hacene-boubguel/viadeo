module Viadeo 
  # == List of actions
  # * retrieve (find, get)
  # == List of connections
  # * groups (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/search/groups]
  # * joboffers (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/search/joboffers]
  # * jobs (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/search/jobs]
  # * schoolorganization (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/search/schoolorganization]
  # * users (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/search/users]
  # == Example :
  #  require "viadeo"
  #  # Search users at paris school and limit the result to 5
  #  search = Viadeo::Search.new(access_token, connection: "users")
  #  search.find(school: "paris", limit: 5)
  #
  # *WARNING*: if it called without connection it raise an error 

  class Search < GraphConnection
    include Viadeo::Operations::Get
  
    protected
    def url
      "#{super}/#{@connection}" 
    end
  end
end

