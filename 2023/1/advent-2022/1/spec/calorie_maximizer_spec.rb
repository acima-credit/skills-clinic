# frozen_string_literal: true

require_relative '../lib/calorie_maximizer'

RSpec.describe CalorieMaximizer do
  describe 'Advent sample set' do
    # This list represents the Calories of the food carried by five Elves:
    #
    #   The first Elf is carrying food with 1000, 2000, and 3000 Calories, a total of 6000 Calories.
    #   The second Elf is carrying one food item with 4000 Calories.
    #   The third Elf is carrying food with 5000 and 6000 Calories, a total of 11000 Calories.
    #   The fourth Elf is carrying food with 7000, 8000, and 9000 Calories, a total of 24000 Calories.
    #   The fifth Elf is carrying one food item with 10000 Calories.
    #   In case the Elves get hungry and need extra snacks, they need to know which Elf to ask: they'd like to know
    #   how many Calories are being carried by the Elf carrying the most Calories. In the example above, this is 24000 (carried by the fourth Elf).

    # Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?
    context 'failure' do
      context 'no args' do
        subject { described_class.new }
        it('fails') { expect { subject }.to raise_error(ArgumentError) }
      end
    end

    context 'success' do
      subject { described_class.new(file_relative_path: '/../spec/data/calories.txt') }
      context 'success with args' do
        it do
          expect(subject.call[0]).to eq(24000) # 24000 Calories
          expect(subject.call[1]).to eq(4) # the fourth Elf
        end
      end
    end
  end

  describe 'Another sample set' do
    # This list represents the Calories of the food carried by five Elves:
    #
    #   The first Elf is carrying food with 10, 10, and 30 Calories, a total of 50 Calories.
    #   The second Elf is carrying food items with 200, 9000 Calories, a total of 9200 Calories.
    #   The third Elf is carrying food with 1250 and 800 Calories, a total of 2050 Calories.
    #   The fourth Elf is carrying food with 1200, 10, and 30 Calories, a total of 1240 Calories.
    #   The fifth Elf is carrying a lot of food item with 5000,300, 2000, 1900, 18000 Calories, a total of 27200, man is he hungry... I wonder if he will even share.
    #   In case the Elves get hungry and need extra snacks, they need to know which Elf to ask: they'd like to know
    #   how many Calories are being carried by the Elf carrying the most Calories. In the example above, this is 24000 (carried by the fourth Elf).

    # Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?
    context 'failure' do
      context 'bad file path' do
        subject { described_class.new(file_relative_path: '/../spec/data/i_dont_exist.txt') }
        it('fails') do
          expect(subject.call).to eq (
           { code: 'Errno::ENOENT', message: 'No such file or directory', status: :file_read_error }
         )
        end
      end
    end

    context 'success' do
      subject { described_class.new(file_relative_path: '/../spec/data/sample_set_2.txt') }
      context 'success with args' do
        it do
          expect(subject.call[0]).to eq(27200) # 27200 Calories
          expect(subject.call[1]).to eq(5) # the fifth greedy Elf with all the snacks
        end
      end
    end
  end
end
