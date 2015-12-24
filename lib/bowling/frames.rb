require 'bowling/frame'

module Bowling
  class Frames
    include Enumerable

    attr_reader :current_frame_number

    def initialize(players)
      @frames = []
      @current_frame_number = 1

      players.each do |player|
        10.times { |n| @frames << Frame.new(n + 1, player) }
      end
    end

    def each(&block)
      @frames.each(&block)
    end

    def record_chance(player, pins)
      frame = find(current_frame_number, player)
      frame.record_chance(pins)
      @current_frame_number += 1 if frame.complete?
    end

    def find(num, player)
      @frames.select { |f| f.number == num && f.player.name == player.name }.first
    end

    def method_missing(method_name, *args, &block)
      @frames.send(method_name, *args, &block)
    end
  end
end
