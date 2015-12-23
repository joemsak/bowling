require "bowling/version"
require "bowling/game"
require "bowling/player"

module Bowling
  def self.start(*player_names)
    Game.new(player_names)
  end
end
