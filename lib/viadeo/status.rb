module Viadeo 
  # == List of actions
  # * create : Also aliased as post : (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/status]
  # == Example :
  #  require "viadeo"
  #  
  #  # Post a status
  #  status = Viadeo::Status.new(access_token)
  #  status.create(message: "Your message")

  class Status < GraphObject
    include Viadeo::Operations::Create
  end
end

