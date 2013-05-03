module Viadeo
  def self.request(method, options={})
    headers = {
      :user_agent => "Viadeo gem/#{Viadeo::VERSION}",
      :authorization => "Bearer #{options[:access_token]}",
      :content_type => "application/x-www-form-urlencoded;charset=UTF-8"
    }
    timeout_options = {timeout: Viadeo.config.timeout, open_timeout: Viadeo.config.open_timeout}

    conn = Faraday.new(:url => Viadeo.config.url) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.send(method) do |req|
      req.url(options[:id].nil? ?  options[:url] : options[:id])
      req.headers = headers
      req.options = timeout_options
      req.params = options[:params] if options[:params] 
    end
    Viadeo.log "response : body : " + response.body
    Viadeo::Util.filter_response(response)
  end
end
