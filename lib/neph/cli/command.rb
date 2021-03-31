module Neph
  module CLI
    class Command < Dry::CLI::Command
      class << self
        attr_accessor :task
        attr_accessor :environment
      end

      def call(**options)
        self.class.task.execute(self.class.environment, **options)
      end
    end
  end
end
