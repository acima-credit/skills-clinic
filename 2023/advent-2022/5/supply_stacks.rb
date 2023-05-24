stackArr = [[], [], []]

File.open('input.txt').each_with_index do |line, index|
  if index <= 2
    stackArr[0] << (line[1]) unless line[1]  == ' ' || line[1].nil?
    stackArr[1] << (line[5]) unless line[5]  == ' ' || line[5].nil?
    stackArr[2] << (line[9]) unless line[9]  == ' ' || line[9].nil?

  elsif index >= 5
    instr = line.split.select { |x| x.to_i.to_s == x }
    puts "instr: #{instr}"
  end
end

#     [D]
# [N] [C]
# [Z] [M] [P]
#  1   2   3

# move 1 from 2 to 1
# move 3 from 1 to 3
# move 2 from 2 to 1
# move 1 from 1 to 2
