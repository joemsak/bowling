require "bowling/player"

module Bowling
  class Players
    include Enumerable

    def initialize(names)
      @players ||= names.collect do |name|
        Player.new(name)
      end
    end

    def each(&block)
      @players.each(&block)
    end

    def method_missing(method_name, *args, &block)
      @players.send(method_name, *args, &block)
    end
  end
end
