require 'spec_helper'

RSpec.describe Bowling::Game do
  let(:game) { Bowling::Game.new('Joe') }
  let(:player) { game.players.last }

  it 'scores the first roll' do
    roll = game.roll(player)
    frame = game.frame(1, player)
    expect(frame.chances.first).to eq(roll)
  end

  it 'scores the second roll' do
    allow(game).to receive(:rand).with(11) { 9 }
    game.roll(player)

    allow(game).to receive(:rand).with(11) { 0 }
    game.roll(player)

    frame = game.frame(1, player)
    expect(frame.chances).to eq([9, 0])
  end

  it 'scores strikes' do
    allow(game).to receive(:rand).with(11) { 10 }
    game.roll(player)

    allow(game).to receive(:rand).with(11) { 8 }
    game.roll(player)
    frame = game.frame(2, player)
    expect(frame.chances).to eq([8])
  end

  it 'scores a boring 10th frame' do
    9.times do
      allow(game).to receive(:rand).with(11) { 10 }
      game.roll(player)
    end

    allow(game).to receive(:rand).with(11) { 5 }
    game.roll(player)

    allow(game).to receive(:rand).with(11) { 4 }
    game.roll(player)

    frame = game.frame(10, player)
    expect(frame).to be_complete
    expect(frame.score).to eq(9)
  end

  it 'scores a spared 10th frame' do
    9.times do
      allow(game).to receive(:rand).with(11) { 10 }
      game.roll(player)
    end

    allow(game).to receive(:rand).with(11) { 5 }
    game.roll(player)

    allow(game).to receive(:rand).with(11) { 5 }
    game.roll(player)

    allow(game).to receive(:rand).with(11) { 5 }
    game.roll(player)

    frame = game.frame(10, player)
    expect(frame).to be_complete
    expect(frame.score).to eq(15)
  end
end
