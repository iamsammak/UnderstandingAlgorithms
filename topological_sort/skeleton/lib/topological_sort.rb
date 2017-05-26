require_relative 'graph'
require 'set'

# Implementing topological sort using both Khan's and Tarian's algorithms

#Kahn's
# def topological_sort(vertices)
#   sorted = []
#   queue = []
#   in_edge_counts = {}
#
#   vertices.each do |vertex|
#     in_edge_counts[vertex] = vertex.in_edges.count
#     queue << vertex if vertex.in_edges.empty?
#   end
#
#   until queue.empty?
#     vertex = queue.shift
#     sorted << vertex
#     vertex.out_edges.each do |edge|
#       to_vertex = edge.to_vertex
#       in_edge_counts[to_vertex] -= 1
#       queue << to_vertex if in_edge_counts[to_vertex] == 0
#     end
#   end
#
#   sorted
# end
#time complexity is O(|V| + |E|)
# V = num of vertices
# E = num of edges

#Tarjans
def topological_sort(vertices)
  sorted = []
  explored = Set.new

  vertices.each do |vertex|
    dfs!(vertex, explored, sorted) unless explored.include?(vertex)
  end

  sorted
end

def dfs!(vertex, explored, sorted)
  explored.add(vertex)

  vertex.out_edges.each do |edge|
    new_vertex = edge.to_vertex
    dfs!(new_vertex, explored, sorted) unless explored.include?(new_vertex)
  end
  sorted.unshift(vertex)
end
