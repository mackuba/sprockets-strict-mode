require 'test/unit'
require 'pathname'

module Sprockets
  class Processor
    attr_accessor :data
  end
end

class FakeContext
  attr_accessor :pathname

  def initialize(path)
    @pathname = Pathname.new(path)
  end
end
