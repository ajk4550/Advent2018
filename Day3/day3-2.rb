# Advent of Code 2018 - Day 3 part 2
# This program is part of the advent of code 2018. This challenge is similar
# to part 1 but you need to find the ID of the claim that does not overlap.
#
# Aaron Kaye, 2018
# Expected output: 707
require 'set'
require_relative 'point'

points = Array.new
visited = Hash.new
claims = Set.new

# Load the data from the file
File.open("day3-1.txt", "r") do |f|
    f.each_line do |line|
        # Define the shape parameters
        # Expected input: #123 @ 3,2: 5x4
        claim = line.split(" ")[0].split("#")[1]
        coordinates = line.split(" ")[2].chomp(":")
        x_start = coordinates.split(",")[0].to_i
        y_start = coordinates.split(",")[1].to_i
        shape = line.split(" ")[3]
        length = shape.split("x")[0].to_i
        width = shape.split("x")[1].to_i

        # Store the new claim
        claims.add(claim)

        # Create the associated points for the shape
        for w in 0...width
            for l in 0...length
                points.push(Point.new(x_start+l, y_start+w, claim))
            end
        end 
    end
end

# Loop through the created points array to find the unique point
# The visited has a point as its key and a claim as it's value
points.each_with_index do |p, i|
    # Check if the point has already been visited
    if visited.has_key?(p)
        # If yes, remove the two claims because they intersect
        claims.delete(p.claim)
        claims.delete(visited[p])
    else
        # Otherwise, add it to the listed of visited points
        visited[p] = p.claim
    end
end

# Display the results
puts "Unique ID: #{claims.to_a[0]}"