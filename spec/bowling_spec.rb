require 'spec_helper'

describe Bowling do
  it 'does not start a game without a player' do
    game = Bowling.start
    expect(game).not_to be_started

    game = Bowling.start('Joe')
    expect(game).to be_started
    expect(game.players.last.name).to eq('Joe')
  end

  it 'takes multiple player info' do
    game = Bowling.start('Joe', 'Larry')
    expect(game.players.first.name).to eq('Joe')
    expect(game.players.last.name).to eq('Larry')
  end
end
