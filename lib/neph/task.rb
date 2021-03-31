module Neph
  class Task
    attr_reader :name, :description

    def initialize(name, description:, **options)
      @name = name.to_s
      @description = description
    end

    def execute(environment, **options)
      puts environment.inspect
      puts options.inspect
    end

    def inspect
      "#<#{self.class.name}:#{name}>"
    end
  end
end
