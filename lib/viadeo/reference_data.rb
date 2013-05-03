module Viadeo 
  # == List of actions
  # * all : Also aliased as : list
  # == List of  resources
  # * companydepartment (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/companydepartment/list/&domains=,Reference%20data]
  # * companyindustry (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/companyindustry/list/&domains=,Reference%20data]
  # * companynewscategory (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/companynewscategory/list/&domains=,Reference%20data]
  # * contracttype (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/contracttype/list/&domains=,Reference%20data]
  # * country (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/country/list/&domains=,Reference%20data]
  # * experiencelevel (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/experiencelevel/list/&domains=,Reference%20data]
  # * imtype (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/imtype/list/&domains=,Reference%20data]
  # * jobcategory (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/jobcategory/list/&domains=,Reference%20data]
  # * language (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/language/list/&domains=,Reference%20data]
  # * newscategory (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/newscategory/list/&domains=,Reference%20data]
  # * professionalstatus (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/professionalstatus/list/&domains=,Reference%20data]
  # * studylevel (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/studylevel/list/&domains=,Reference%20data]
  # * videoprovider (details)[http://dev.viadeo.com/documentation/graph-api-resource/?resource=/videoprovider/list/&domains=,Reference%20data]
  #
  # == Example :
  #  require "viadeo"
  #
  #  # Retrieve reference list of languages and limit the result to 5
  #  reference_data = Viadeo::ReferenceData.new(access_token, resource: "language")
  #  reference_data.all(limit: 5)
  #
  # *WARNING*: if it called without resource parameter it raise MissingResourceError

  class ReferenceData < GraphObject
    include Viadeo::Operations::List

    def initialize(access_token, options={})
      raise Viadeo::MissingResourceError.new("resource parameter is mandatory") unless options[:resource]
      @resource = options[:resource]
      super(access_token, options)
    end

    protected
    def url
      "#{@resource}"
    end
  end
end

