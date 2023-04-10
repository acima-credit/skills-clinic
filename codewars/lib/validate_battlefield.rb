# https://www.codewars.com/kata/52bb6539a4cf1b12d90005b7

# DESCRIPTION:
# Write a method that takes a field for well-known board game "Battleship" as an argument and returns true if it has a valid disposition of ships, false otherwise. Argument is guaranteed to be 10*10 two-dimension array. Elements in the array are numbers, 0 if the cell is free and 1 if occupied by ship.

# Battleship (also Battleships or Sea Battle) is a guessing game for two players. Each player has a 10x10 grid containing several "ships" and objective is to destroy enemy's forces by targetting individual cells on his field. The ship occupies one or more cells in the grid. Size and number of ships may differ from version to version. In this kata we will use Soviet/Russian version of the game.


# Before the game begins, players set up the board and place the ships accordingly to the following rules:
# There must be single battleship (size of 4 cells), 2 cruisers (size 3), 3 destroyers (size 2) and 4 submarines (size 1). Any additional ships are not allowed, as well as missing ships.
# Each ship must be a straight line, except for submarines, which are just single cell.

# The ship cannot overlap or be in contact with any other ship, neither by edge nor by corner.

# This is all you need to solve this kata. If you're interested in more information about the game, visit this link.

BATTLESHIP_SIZE = 4
CRUISER_SIZE    = 3
DESTROYER_SIZE  = 2
SUBMARINE_SIZE  = 1
EXPECTED_BATTLESHIP_COUNT = 1
EXPECTED_CRUISER_COUNT    = 2
EXPECTED_DESTROYER_COUNT  = 3
EXPECTED_SUBMARINE_COUNT  = 4
WIDTH           = 10
HEIGHT          = 10

def validate_battlefield(field)
  return false unless field.size == WIDTH
  return false unless field.first.size == HEIGHT
  return false unless field.flatten.sum == 1*BATTLESHIP_SIZE + 2*CRUISER_SIZE + 3*DESTROYER_SIZE + 4*SUBMARINE_SIZE

 true
end

# method to count the length of the ships and how many we find
battleships = 0
cruisers    = 0
destroyers  = 0
submarines  = 0

# method to check adjacent elements

def adjacent_elements(field)
  HEIGHT.times do |x|
    WIDTH.times do |y|
        field[x][y] == 1
        return false if diagonals(x,y)
      # check against right index
      if
        true
      end
      # check below
      if

      # check left

      # check up
    end
  end
end

def diagonals(x,y)
  diagonal = false
  if x-1 >= 0 or y-1 >= 0 #if not out of bounds
    diagonal = field[x-1],[y-1] == 1 or diagonal
  end
  if x+1 <= 10 or y-1 >= 0 #if not out of bounds
    diagonal =  field[x+1],[y-1] == 1 or diagonal
  end
  if x-1 >= 0 or y+1 <= 10 #if not out of bounds
    diagonal =  field[x-1],[y+1] == 1 or diagonal
  end
  if x+1 <= 10 or y+1 <= 10 #if not out of bounds
    diagonal =  field[x+1],[y+1] == 1 or diagonal
  end
  return diagonal
end




# field.each_with_index do |row, i|
#   row.each_with_index do |col, j|

#   end
# end


# adjacent_elements(x,y, from)
# return false if diagaonals == true
# row = false
# col = false
# row = (x-1) or (x+1)
# col = (y-1) or (y+1)
# return false if row and col
# if row
# adjacent_elements(x+1,y, from)
# adjacent_elements(x-1,y, from)
# {true, -1}


# adjacent_elements
# no diagonals
# ships are straight lines
# count ship lengths and incrament variable
