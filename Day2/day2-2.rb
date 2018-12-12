# Advent of Code 2018 - Day 2 Part 2
# This program related to the advent of code. This program checks for near
# identical ID's and reports what the letters are of the neighboring IDs.
# ID's that are neighboring will differ by only one letter. Text input is
# the same as the previous exercise.
#
# Aaron Kaye, 2018
# Expected Output: pbykrmjmizwhxlqnasfgtycdv
require 'set'

data = Set.new

# Load the data file into a data structure
File.open("day2-1.txt", "r") do |f|
    f.each_line do |line|
        data.add(line)
    end
end

# Search the data for the neighboring ID's
# Requirement: Neighbors must be off by only one letter
# Assumptions: There is only one pair of neighboring IDs
data.each do |current|
    data.each do |compare|
        if current.eql?(compare)
            # The IDs are identical, don't compare
            break
        end

        differences = 0 # number of differences
        similar = "" # String built containing the similar letters
        arr_cur = current.split("") # Splitting the current into letters
        arr_com = compare.split("") # Splitting the compare into letters

        # Looping through to compare the letters
        arr_cur.each_with_index do |l, i|
            # Check if the difference exceeds allowed
            if differences > 1
                break
            else
                # Haven't reached max differences, compare the letters
                if !l.eql?(arr_com[i])
                    # Letters differ, increase number of differences
                    differences += 1
                else
                    # Letters the same, store the letter for possible result
                    similar << l
                end
            end
        end
        if differences <= 1
            # Finished comparing with only 1 or less differences
            puts "Pair Found..."
            puts similar
            exit(true) # Fully exit the program if one match is found
        end
    end
end

# Algorithm
# 1. Get the first line from the data,
# 2. Get the line to compare it to.
# 3. Go through letter by letter until there are 2 unique letters
# which indicates the IDs are not neighbors
# 4. Search until the first match is found, display results