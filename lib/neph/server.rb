module Neph
  class Server
    attr_reader :name

    def initialize(name, **options)
      @name = name
    end
  end
end
