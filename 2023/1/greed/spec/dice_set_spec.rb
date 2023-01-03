# frozen_string_literal: true

require "spec_helper"
require "dice_set"

describe DiceSet do
  let(:dice_set) { DiceSet.new }

  it "tests the truth" do
    expect(true).to be_truthy
  end

  describe "#roll" do
    it "should default to 5 dice in a roll" do
      expect(dice_set.values.size).to equal(0)

      dice_set.roll

      expect(dice_set.values.size).to equal(5)
    end

    it "should roll the given number of dice" do
      expect(dice_set.values.size).to equal(0)

      dice_set.roll(amount: 3)

      expect(dice_set.values.size).to equal(3)
    end

    it "should generate values between 1 and 6 inclusively" do
      dice_set.roll

      expect(dice_set.values.select { |die| die < 1 || die > 6 }).to be_empty
    end

    it "should generate integers" do
      dice_set.roll

      expect(dice_set.values.all? { |die| die.is_a?(Integer) }).to be_truthy
    end
  end

  describe "#values" do
    it "should be empty for a new dice set" do
      expect(dice_set.values).to be_empty
    end

    it "should be read-only" do
      dice_set.values << 123

      expect(dice_set.values).not_to include(123)
    end

    it "should not change when called multiple times" do
      values = dice_set.values

      dice_set.values
      dice_set.values
      dice_set.values

      expect(dice_set.values).to eq(values)
    end
  end

  describe "#values=" do
    it "raises an error when not given an array" do
      expect { dice_set.values = { foo: "bar" } }.to raise_error(::DiceSet::ArgumentError)
    end

    it "raises an error when given invalid values" do
      expect { dice_set.values = [7] }.to raise_error(::DiceSet::ArgumentError)
      expect { dice_set.values = [0] }.to raise_error(::DiceSet::ArgumentError)
      expect { dice_set.values = [1, nil, 2] }.to raise_error(::DiceSet::ArgumentError)
    end

    it "sets the values to the given array of values" do
      dice = [1, 2, 3, 4, 5]

      dice_set.values = dice

      expect(dice_set.values).to eq(dice)
    end
  end

  describe "#score" do
    it "returns 0 when the values is empty" do
      dice_set.values = []

      expect(dice_set.score).to eq(0)
    end
  end
end
