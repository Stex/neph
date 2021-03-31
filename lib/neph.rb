# frozen_string_literal: true

require "neph/version"
require "neph/refinements/hash"

require "neph/chain"
require "neph/config"
require "neph/environment"
require "neph/task"

require "neph/commands"
require "neph/commands/base"
require "neph/commands/run_locally"

module Neph
  class Error < StandardError; end
end
