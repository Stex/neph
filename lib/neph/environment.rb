module Neph
  class Environment
    attr_reader :name

    def initialize(name, **options)
      @name = name
    end

    def servers
    end
  end
end
