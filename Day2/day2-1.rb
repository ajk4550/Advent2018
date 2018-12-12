# Advent of Code 2018 - Day 2 Part 1
# This program related to the advent of code. The program counts the number of double
# letters and triple letter occurances and creates a checksum by multiplying the two
# types of occurences:
# Num_of_doubles * Num_of_triples = checksum
#
# Aaron Kaye, 2018
# Expected Output: 6000

double = 0
triple = 0
freq_hash = Hash.new
not_verbose = true

# Reading the data from the associated file
File.open("day2-1.txt", "r") do |f|
    f.each_line do |line|
        # For each line, count letter occurances
        line.split("").each do |letter|
            if letter == "\n"
                # Ignore new line characters in the file
                break
            else
                if freq_hash.has_key?(letter)
                    # Already counted at least one instance
                    current = freq_hash[letter]
                    freq_hash[letter] = current + 1
                else
                    # First instance of this letter
                    freq_hash[letter] = 1
                end
            end
        end
        # Update the running totals based on frequency count
        if freq_hash.has_value?(2)
            double += 1
        end
        if freq_hash.has_value?(3)
            triple += 1
        end
        # Resetting the hash for the next line
        puts freq_hash unless not_verbose
        freq_hash = {}
    end
end

# Calculating the final checksum
puts "Checksum is: #{double * triple}"