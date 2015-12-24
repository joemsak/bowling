module Bowling
  class Game
    attr_reader :players, :frames

    def initialize(names)
      names = [names].flatten
      @started = names.any?
      @players = Players.new(names)
      @frames = Frames.new(players)
    end

    def roll(player)
      pins = rand(11)
      frames.record_chance(player, pins)
      pins
    end

    def frame(num, player)
      frames.find(num, player)
    end

    def started?
      @started
    end
  end
end
