module Viadeo 
  # == List of actions
  # * find : Also aliased as : retrieve, get (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/recommend#GET_recommend]
  # * create : Also aliased as post : (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/recommend#POST_recommend]
  # == Examples :
  #  require "viadeo"
  #  
  #  # Retrieve recommended URL infos and limit the result to 5
  #  recommend = Viadeo::Recommend.new(access_token)
  #  recommend.retrieve(url: "http://dev.viadeo.com", limit: 5)
  #
  #  #recommend a new URL
  #  recommend.create(url: "http://dev.viadeo.com", title: "Get started with the Viadeo API")

  class Recommend < GraphObject
    include Viadeo::Operations::Get
    include Viadeo::Operations::Create
  end
end

