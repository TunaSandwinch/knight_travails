# frozen_string_literal: true

class Board # rubocop:disable Style/Documentation
  attr_accessor :prev_vertex, :value, :vertices

  def initialize(vertex_value, parent_vertex = nil)
    @prev_vertex = parent_vertex
    @value = vertex_value
    @vertices = []
    make_vertices
  end

  def make_vertices
    moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [1, -2]]
    x = value[0]
    y = value[1]
    moves.each do |dx, dy|
      new_x = x + dx
      new_y = y + dy
      vertices << [new_x, new_y] if new_x.between?(0, 8) && new_y.between?(0, 8)
    end
  end
end
