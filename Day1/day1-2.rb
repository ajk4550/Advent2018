# Advent Day of Code 2018 - Day 1 Part 2
# This program is related to the advent of code. Searches for a duplicate 
# frequency occurence.
# Aaron Kaye, 2018
#
# Expected Output: 65474

require 'set'
freq = 0 # Starting frequency
visited_freq = Set.new
searching = true
not_verbose = true

# Read frequency changes from text file and apply to freq
while searching
    File.open("day1-2.txt", "r") do |f|
        f.each_line do |line|
            # Apply frequency transformation
            ops = line[0]
            val = line[1..-1].to_i
            if ops == "+"
                freq += val
            elsif ops == "-"
                freq -= val
            end

            # Check for duplicate frequency value
            puts "Frequency is currently: #{freq}" unless not_verbose
            if visited_freq.include?(freq)
                puts "Duplicate frequency Found!" unless not_verbose
                searching = false
                break
            else
                visited_freq.add(freq)
            end
        end
    end
end

# Display the final results
puts "The duplicate frequency is: #{freq}"