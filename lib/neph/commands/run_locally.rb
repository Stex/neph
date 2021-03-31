module Neph
  module Commands
    class RunLocally < Base
      def call
        system(payload)
      end
    end

    Neph::Commands.register_command "run_locally", RunLocally
  end
end
