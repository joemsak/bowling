module Bowling
  class Game
    attr_reader :players, :frames, :current_frame

    def initialize(names)
      names = [names].flatten
      @started = names.any?
      @players = Players.new(names)
      @frames = Frames.new(players)
      @current_frame = 1
    end

    def roll(player)
      pins = rand(11)
      frame = frame(current_frame, player.name)

      frame.record_chance(pins)
      @current_frame += 1 if frame.complete?

      pins
    end

    def frame(num, player_name)
      frames.find(num, player_name)
    end

    def started?
      @started
    end
  end
end
