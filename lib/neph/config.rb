require "psych"

module Neph
  #
  # Acts as a registry of everything read from the local neph.yml file.
  # All other classes should only act with this class instead of processing the file on their own.
  #
  class Config
    using Neph::Refinements::Hash

    class << self
      def exists?
        File.exist?(config_path)
      end

      def environments
        @environments ||= config_yaml["environments"].map do |name, options|
          Environment.new(name, **options.symbolize_keys)
        end
      end

      def task(name)
        tasks.find { |t| t.name == name.to_s }
      end

      def tasks
        @tasks ||= config_yaml["tasks"].map do |task_name, options|
          Task.new(task_name, **options.symbolize_keys)
        end
      end

      private

      def config_path
        File.expand_path("neph.yml", Dir.pwd)
      end

      def config_yaml
        Psych.safe_load(File.read(config_path))
      end
    end
  end
end
