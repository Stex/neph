require "dry-initializer"

module Neph
  module Commands
    class Base
      extend Dry::Initializer

      param :payload, type: proc(&:to_s)

      #
      # Executes the command. Has access to the current sshkit environment.
      #
      def call(*)
        fail NotImplementedError,
          "Implement the actual command functionality in your subclass by defining a #call method."
      end
    end
  end
end
