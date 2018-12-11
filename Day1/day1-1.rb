# Advent Day of Code 2018 - Day 1
# This program is related to the advent of code
# Aaron Kaye, 2018
#
# Expected Output: 459

freq = 0 # Starting frequency

# Read frequency changes from text file and apply to freq
File.open("day1-1.txt", "r") do |f|
    f.each_line do |line|
        ops = line[0]
        val = line[1..-1].to_i
        if ops == "+"
            freq += val
        elsif ops == "-"
            freq -= val
        end
    end
end

# Display the final results
puts "Resulting Frequency is: #{freq}"