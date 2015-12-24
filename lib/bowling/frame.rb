module Bowling
  class Frame
    attr_reader :number, :player, :chances

    def initialize(number, player)
      @number = number
      @player = player
      @chances = []
    end

    def record_chance(pins)
      @chances << pins
    end

    def complete?
      case number
      when 10
        (chances.size == 2 && score < 10) || chances.size == 3
      else
        score == 10 || chances.size == 2
      end
    end

    def score
      chances.inject(:+)
    end
  end
end
