module Bowling
  class Game
    attr_reader :started

    def initialize(names)
      @started = names.any?
      @names = names
    end

    def started?
      @started
    end

    def players
      @players ||= names.collect do |name|
        Player.new(name)
      end
    end

    private
    attr_reader :names
  end
end
