class RubyServ::IRC::Base
  class << self
    def all
      collection_variable
    end

    def first
      collection_variable.first
    end

    def last
      collection_variable.last
    end

    # Gives find_by_* functionality
    def method_missing(method, *args, &block)
      if method.to_s.start_with?('find_by_')
        collection_variable.select { |item| item.send(method.to_s.sub('find_by_', '')) == args[0] }
      else
        super
      end
    end

    private

    def collection_variable
      self.instance_variable_get("@#{self.to_s.sub('RubyServ::IRC::', '').downcase}s")
    end
  end
end