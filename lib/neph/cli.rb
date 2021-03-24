require "dry/cli"
require "neph"
require "neph/version"

module Neph
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Version < Dry::CLI::Command
        desc "Print version"

        def call(*)
          puts Neph::VERSION
        end
      end

      class Pwd < Dry::CLI::Command
        desc "Print current directory"

        def call(*)
          puts Dir.pwd
        end
      end

      class Deploy < Dry::CLI::Command
        desc "Execute a task"

        argument :task, type: :string, required: true, desc: "Task to be executed"
        argument :dirs, type: :array, required: false, desc: "Optional directories"

        def call(task:, dirs: [], **)
          puts "exec - task: #{task}, dirs: #{dirs.inspect}"
        end
      end

      register "version", Version, aliases: ["v", "-v", "--version"]
      register "pwd", Pwd
    end

    def self.start
      Dry::CLI.new(Commands).call
    end
  end
end
