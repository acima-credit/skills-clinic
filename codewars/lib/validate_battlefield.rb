BATTLESHIP_SIZE = 4
CRUISER_SIZE    = 3
DESTROYER_SIZE  = 2
SUBMARINE_SIZE  = 1

def validate_battlefield(field)
  return false unless field.flatten.sum == 1*BATTLESHIP_SIZE + 2*CRUISER_SIZE + 3*DESTROYER_SIZE + 4*SUBMARINE_SIZE

end
