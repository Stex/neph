require "dry/cli"
require "neph"
require "neph/cli/command"
require "yaml"
require "json"

module Neph
  module CLI
    # noinspection ALL
    module Commands
      extend Dry::CLI::Registry

      class Version < Dry::CLI::Command
        desc "Print version"

        def call(*)
          puts Neph::VERSION
        end
      end

      register "version", Version, aliases: ["v", "-v", "--version"]

      ::Neph::Config.environments.each do |env|
        ::Neph::Config.tasks.each do |task|
          register("#{env.name} #{task.name}", Class.new(Neph::CLI::Command) {
            desc task.name
            option :dry_run, desc: "Do not actually perform any steps, only print them", type: :boolean, default: false

            self.task = task
            self.environment = env
          })
        end
      end
    end

    def self.start
      Dry::CLI.new(Commands).call
    end
  end
end
