def valid_move(x, y)
  (0..7).cover?(x) && (0..7).cover?(y)
end

def knight_moves(start, target)
  moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]

  queue = [[start, [start]]]
  visited = Array.new(9) { Array.new(9, false) }

  visited[start[0]][start[1]] = true

  until queue.empty?
    current_pos, path = queue.shift
    x, y = current_pos

    return path if current_pos == target

    moves.each do |dx, dy|
      new_x, new_y = x + dx, y + dy
      if valid_move(new_x, new_y) && !visited[new_x][new_y]
        visited[new_x][new_y] = true
        queue << [[new_x, new_y], path + [[new_x, new_y]]]
      end
    end
  end
  nil
end


start = [0, 0]
target = [7, 7]
path = knight_moves(start, target)

puts "Shortest path for the knight from #{start} to #{target}:"
path.each { |pos| p pos }