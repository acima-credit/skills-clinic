# frozen_string_literal: true

TOTAL_SHIPS = {
  4 => 1,
  3 => 2,
  2 => 3,
  1 => 4
}.freeze

def validate_battlefield(field)
  return false unless field.flatten.sum == 20
  return false unless validate_no_adjacent_ships(field)
end

def validate_no_adjacent_ships(field)
  field.flatten.each_with_index do |val, index|
    if val == 1
      return true if index == 90

      if (index % 9).zero? && !index.zero?
        return false if field[index + 9] == 1

      elsif (index % 10).zero?
        return false if field[index + 11] == 1

      elsif field[index + 11] == 1 || field[index + 9] == 1
        return false
      end
    end
    return true
  end
end

def validate_correct_number_of_ships(field)
  field.flatten.each_with_index do |val, _index|
    next unless val == 1

    valid_hori_ship?(field)
    valid_vert_ship?(field)
    total_ships[1] = total_ships[1] - 1
  end
end

def valid_hori_ship?(field)
  return unless field[index + 1] == 1

  tmp = index + 1
  tmp += 1 while field[tmp] == 1
  ship_size = tmp - index
  return false if ship_size > 4

  total_ships[ship_size] -= 1
end

def valid_vert_ship?(field)
  return unless field[index + 10] == 1

  tmp = index + 10
  tmp += 10 while field[tmp] == 1
end

# Consider the case where a ship is on index 9, and another ship is on index 10.  Although they
# are on different columns therefor valid, iterating through would consider them the same ship.
# Maybe guard clause to ensure this does happen?  ?? ?

# [[1, 1, 1, 1, 1, 0, 0, 1, 1, 1],
# [1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
# [0, 0, 1, 1, 1, 1, 1, 1, 1, 1],
# [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
# [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
# [0, 0, 0, 1, 1, 1, 0, 0, 0, 0],
# [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
# [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
# [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
# 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
