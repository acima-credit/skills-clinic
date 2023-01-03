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

    it "must be order-independent" do
      dice_set.values = [1,2,3,4,5]
      score1 = dice_set.score
      dice_set.values = [5,4,3,2,1]
      score2 = dice_set.score

      expect(score1).to eq(score2)
    end

    it "returns 100 for a single 1" do
      dice_set.values = [1]

      expect(dice_set.score).to eq(100)
    end

    it "returns 50 for a single 5" do
      dice_set.values = [5]

      expect(dice_set.score).to eq(50)
    end

    it "returns 1000 for three 1's" do
      dice_set.values = [1,1,1]

      expect(dice_set.score).to eq(1000)
    end

    it "returns 600 for three 6's" do
      dice_set.values = [6,6,6]

      expect(dice_set.score).to eq(600)
    end

    it "returns 500 for three 5's" do
      dice_set.values = [5,5,5]

      expect(dice_set.score).to eq(500)
    end

    it "returns 400 for three 4's" do
      dice_set.values = [4,4,4]

      expect(dice_set.score).to eq(400)
    end

    it "returns 300 for three 3's" do
      dice_set.values = [3,3,3]
      expect(dice_set.score).to eq(300)
    end

    it "returns 200 for three 2's" do
      dice_set.values = [2,2,2]
      expect(dice_set.score).to eq(200)
    end

    it "returns 1100 for four 1's" do
      dice_set.values = [1,1,3,1,1]

      expect(dice_set.score).to eq(1100)
    end

    it "returns 1100 for three 1's and two 5's" do
      dice_set.values = [5, 1, 1, 5, 1]

      expect(dice_set.score).to eq(1100)
    end

    it "returns 250 for a mix of single 1's and 5's" do
      dice_set.values = [5, 1, 3, 4, 1]

      expect(dice_set.score).to eq(250)
    end

    it "returns 450 for three 4's and a 5" do
      dice_set.values = [2, 4, 4, 5, 4]

      expect(dice_set.score).to eq(450)
    end
  end
end
