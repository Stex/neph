require "dry-container"

module Neph
  module Commands
    extend Dry::Container::Mixin

    def self.register_command(name, klass)
      register name do |payload, options = {}|
        klass.new(payload, **options)
      end
    end

    def self.available
      each do |k, v|
        puts "#{k} #{v}"
      end

      puts
      puts "Total of #{each.size} command(s)."
    end
  end
end
