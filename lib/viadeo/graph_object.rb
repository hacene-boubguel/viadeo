module Viadeo 
  class GraphObject
    include Enumerable

    attr_reader :id, :access_token
    @@initial_attributes = Set.new([:id, :access_token])

    def initialize(access_token, options={})
      raise Viadeo::MissingAccessTokenError.new("access_token parameter is mandatory") if (access_token.nil? ||  access_token.empty?)
      @access_token = access_token
      @id = options[:id] if options[:id]
      @connection = options[:connection] if options[:connection]
      @values = {}
      @updated_attributes = Set.new
    end

    def self.new_from(values, access_token=nil)
      obj = self.new(access_token, values)
      obj.refresh_from(values, access_token)
    end

    def url
      self.class.name.downcase.split('::')[-1] 
    end

    def reset
      @values = {}
      @updated_attributes = Set.new
    end

    def updated?(name=nil)
      return !@updated_attributes.empty? unless name
      return @updated_attributes.include?(name)
    end

    def to_s(*args)
      MultiJson.dump(@values, :pretty => true)
    end

    def inspect()
      id_string = (self.respond_to?(:id) && !self.id.nil?) ? " id=#{self.id}" : ""
      "#<#{self.class}:0x#{self.object_id.to_s(16)}#{id_string}> JSON: " + MultiJson.dump(@values, :pretty => true)
    end

    def refresh_from(values, access_token, partial=false)
      @access_token = access_token
      add_accessors(values.keys)
      values.each do |k, v|
        @values[k] = Util.convert_to_graph_object(v, access_token)
        @updated_attributes.delete(k)
      end
      log("response : graph_object : ", self)
      self
    end

    def [](k)
      k = k.to_sym if k.kind_of?(String)
      @values[k]
    end

    def []=(k, v)
      send(:"#{k}=", v)
    end

    def keys
      @values.keys
    end

    def values
      @values.values
    end

    def to_json(*a)
      MultiJson.dump(@values)
    end

    def to_hash
      @values
    end

    def each(&blk)
      @values.each(&blk)
    end

    protected

    def log(message, arg=nil)
      message += " : " + arg.inspect if arg
      puts message
    end

    def metaclass
      class << self; self; end
    end

    def add_accessors(keys)
      metaclass.instance_eval do
        keys.each do |k|
          next if @@initial_attributes.include?(k)
          k_eq = :"#{k}="
          define_method(k) { @values[k] }
          define_method(k_eq) do |v|
            @values[k] = v
            @updated_attributes.add(k)
          end
        end
      end
    end

    def method_missing(name, *args)
      if name.to_s.end_with?('=')
        attr = name.to_s[0...-1].to_sym
        @values[attr] = args[0]
        @updated_attributes.add(attr)
        add_accessors([attr])
        return
      else
        return @values[name] if @values.has_key?(name)
      end
      super
    end
  end
end

