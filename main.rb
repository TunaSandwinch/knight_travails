# frozen_string_literal: true

require_relative 'lib/board'

def moves(object)
  result = []

  traverse = lambda do |vertex|
    return nil if vertex.nil?

    traverse.call(vertex.prev_vertex)
    result << vertex.value
  end

  traverse.call(object)
  result
end

def knight_moves(curr_position, desired_position) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
  queue = [Board.new(curr_position)]

  until queue.empty?
    queue[0].vertices.each do |position|
      if position == desired_position
        total_moves = moves(Board.new(position, queue[0]))
        puts "you made it in #{total_moves.length - 1} move/s! here is your path"
        total_moves.each { |item| p item }
        return nil
      end

      queue << Board.new(position, queue[0])
    end
    queue.shift
  end
end

knight_moves([3, 3], [8, 8])
