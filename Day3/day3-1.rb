# Advent of Code 2018 - Day 3 part 1
# This program is part of the advent of code 2018. This challenge involves
# finding the number of square inches overlap given a certain set of shapes.
#
# Aaron Kaye, 2018
# Expected output: 116491
require 'set'
require_relative 'point'

points = Array.new
visited = Set.new
overlap_points = Set.new
overlaps = 0

# Load data from the file and create Point objects
File.open("day3-1.txt", "r") do |f|
    f.each_line do |line|
        # Define the shape parameters
        # Expected input: #123 @ 3,2: 5x4
        coordinates = line.split(" ")[2].chomp(":")
        x_start = coordinates.split(",")[0].to_i
        y_start = coordinates.split(",")[1].to_i
        shape = line.split(" ")[3]
        length = shape.split("x")[0].to_i
        width = shape.split("x")[1].to_i

        # Create the associated points for the shape
        for w in 0...width
            for l in 0...length
                points.push(Point.new(x_start+l, y_start+w))
            end
        end 
    end
end

# Loop through the created points array to find overlaps
points.each_with_index do |p, i|
    puts "Checking: #{i} out of #{points.length}"
    # Check if the point has already been visited
    if visited.include?(p)
        # If yes, check if it's already a duplicate and mark accordingly
        overlaps += 1 unless overlap_points.include?(p)
        overlap_points.add(p) unless overlap_points.include?(p)
    else
        # Otherwise, add it to the listed of visited points
        visited.add(p)
    end
end

# Display the results
puts "Overlap: #{overlaps} sq inches"