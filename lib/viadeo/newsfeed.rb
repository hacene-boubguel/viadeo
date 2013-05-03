module Viadeo 
  # == List of actions
  # * find : Also aliased as : retrieve, get (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/newsfeed]
  # 
  # == Example :
  #  require "viadeo"
  #  # Retrieve a list of newsfeeds and limit the result to 5
  #  newsfeed = Viadeo::Newsfeed.new(access_token)
  #  newsfeed.find(limit: 5)

  class Newsfeed < GraphObject
    include Viadeo::Operations::Get
  end
end

