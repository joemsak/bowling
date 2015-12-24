require "bowling/version"
require "bowling/game"
require "bowling/players"
require "bowling/frames"

module Bowling
  def self.start(*player_names)
    Game.new(player_names)
  end
end
