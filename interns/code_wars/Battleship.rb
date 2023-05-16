def validate_battlefield(field)
  return 'false' unless field.flatten.sum == 20
  return 'false' unless validate_no_adjacent_ships(field)
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

  def validate_correct_number_of_ships(field)
    total_ships = {
      4 => 1,
      3 => 2,
      2 => 3,
      1 => 4
    }

    field.flatten.each_with_index do |val, index|
      if val == 1

        # Consider the case where a ship is on index 9, and another ship is on index 10.  Although they
        # are on different columns therefor valid, iterating through would consider them the same ship.
        # Maybe guard clause to ensure this does happen?  ?? ?

        if field[index + 1] == 1
          tmp = index + 1
          tmp += 1 while field[tmp] == 1
          ship_size = tmp - index
          return false if ship_size > 4

          total_ships[ship_size] -= 1

        elsif field[index + 10] == 1
          tmp = index + 10
          tmp += 10 while field[tmp] == 1
        end

      else

        total_ships[1] = total_ships[1] - 1
      end
    end
  end
end

def valid_hori_ship?(range); end

def valid_vert_ship?(range); end
