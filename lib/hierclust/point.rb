module Hierclust
  # A Point represents a single point in n-dimensional space.
  class Point

    # Create a new Point with the given coordinates.
    def initialize(*values)
      @values = values
      raise "Values missing" if @values.nil?
    end

    def x
      value(0)
    end

    def y
      value(1)
    end

    def dimension_count
      @values.size
    end

    def value(dim)
      if @values[dim].nil?
        raise "No dimension #{dim}"
      else
        @values[dim]
      end
    end

    # Returns this distance from this Point to an +other+ Point.
    def distance_to(other)
      Math.sqrt((0..(self.dimension_count-1)).map {|d| (other.value(d) - self.value(d)) ** 2 }.reduce(&:+))
    end

    # Simplifies code by letting us treat Clusters and Points interchangeably
    def size #:nodoc:
      1
    end

    # Simplifies code by letting us treat Clusters and Points interchangeably
    def radius #:nodoc:
      0
    end

    # Simplifies code by letting us treat Clusters and Points interchangeably
    def points #:nodoc:
      [self]
    end

    # Returns a legible representation of this Point.
    def to_s
      "(" + (0..(self.dimension_count-1)).map {|d| self.value(d).to_s }.join(", ") + ")"
    end

    # Sorts points relative to each other on the x-axis.
    #
    # Uses y-axis as a tie-breaker, so that sorting is stable even if
    # multiple points have the same x-coordinate.
    #
    # Uses object_id as a final tie-breaker, so sorts are guaranteed to
    # be stable even when multiple points have the same coordinates.
    def <=>(other)
      (0..(self.dimension_count-1)).each do |d|
        cmp = self.value(d) <=> other.value(d)
        return cmp unless cmp == 0
      end
      self.object_id <=> other.object_id
    end
  end
end
