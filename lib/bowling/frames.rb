require 'bowling/frame'

module Bowling
  class Frames
    include Enumerable

    def initialize(players)
      @frames = []

      players.each do |player|
        10.times { |n| @frames << Frame.new(n + 1, player) }
      end
    end

    def each(&block)
      @frames.each(&block)
    end

    def find(num, player_name)
      @frames.select { |f| f.number == num && f.player.name == player_name }.first
    end

    def method_missing(method_name, *args, &block)
      @frames.send(method_name, *args, &block)
    end
  end
end
