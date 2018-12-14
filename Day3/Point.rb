# Class to represent a 2D data point
class Point
    def initialize(x, y, claim=nil)
        @x = x
        @y = y
        @claim = claim
    end

    def x
        @x
    end

    def y
        @y
    end

    def claim
        @claim
    end

    def ==(other)
        return @x == other.x && @y == other.y
    end

    def eql?(other)
        return @x == other.x && @y == other.y
    end

    def hash
        [@x, @y].hash
    end

    def display
        puts "X: #{@x}, Y: #{@y}"
    end
end