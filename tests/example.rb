require File.join(File.dirname(__FILE__), '..', 'lib', 'hierclust.rb')

=begin
points = (1..20).map { Hierclust::Point.new(rand(10), rand(10)) }
clusterer = Hierclust::Clusterer.new(points)
puts clusterer.clusters.map {|x| x.points }.flatten.join(", ")
puts clusterer.clusters
=end

points = [[7, 4], [6, 5], [9, 5], [9, 6], [5, 8], [5, 8], [7, 7], [6, 7], [8, 0], [3, 1], [7, 2], [8, 2], [6, 0], [5, 1], [1, 5], [3, 6], [3, 4], [2, 4], [0, 0], [0, 2]].map {|pair| Hierclust::Point.new(pair.first, pair.last) }

clusterer = Hierclust::Clusterer.new(points)
#puts clusterer.clusters.map {|x| x.points }.flatten.join(", ")
#puts clusterer.clusters
expected = "[[[[[(7, 4), (6, 5)], [(9, 5), (9, 6)]], [[(5, 8), (5, 8)], [(7, 7), (6, 7)]]], [[[(8, 0), (3, 1)], [(7, 2), (8, 2)]], [(6, 0), (5, 1)]]], [[[(1, 5), (3, 6)], [(3, 4), (2, 4)]], [(0, 0), (0, 2)]]]"
if "#{expected}" == "#{clusterer.clusters}"
  puts "pass"
else
  puts "fail"
end

# cluster in 3d
points = [[9, 3, 3], [8, 3, 5], [4, 1, 4], [0, 6, 1], [3, 8, 1]].map {|pair| Hierclust::Point.new(pair[0], pair[1], pair[2]) }
clusterer = Hierclust::Clusterer.new(points)
#puts clusterer.clusters.map {|x| x.points }.flatten.join(", ")
#puts clusterer.clusters
expected = "[[[(9, 3, 3), (8, 3, 5)], (4, 1, 4)], [(0, 6, 1), (3, 8, 1)]]"
if "#{expected}" == "#{clusterer.clusters}"
  puts "pass"
else
  puts "fail"
end
