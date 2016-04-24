VALUE = 0
DISCOVERED = 1
DISTANCE_TO_END_POINT = 2
DISTANCE_TO_START_POINT = 3


# Second try
ROW = 0
COL = 1
COUNTER = 2

def read_in_maze
  maze_lines = File.readlines(ARGV[0])

  maze_lines.map! do |line|
    line.chomp
  end
end

def find_start_and_end_points(maze_lines)
  start_point = nil
  end_point = nil
  maze_lines.each_with_index do |row, rIdx|
    # p row
    start_point = [rIdx, row.index("S")] unless row.index("S").nil?
    end_point = [rIdx, row.index("E")] unless row.index("E").nil?
  end

  # p start_point
  # p end_point

  {:start => start_point, :end => end_point}
end

def create_maze_graph(maze_lines, points_of_interest)
  maze = Hash.new
  start_point = points_of_interest[:start]
  end_point = points_of_interest[:end]

  maze_lines.each_with_index do |row, rIdx|
    row.chars.each_with_index do |col, cIdx|
      key = [rIdx,cIdx]
      # [value, discovered?, distance_to_origin]
      maze[key] = [col,false,(rIdx - end_point[0] + cIdx - end_point[1]).abs, (rIdx - start_point[0] + cIdx - start_point[1]).abs]
    end
  end

  # p maze
  maze
end

def path_finder(maze, points_of_interest)
  start_point = points_of_interest[:start]
  end_point = points_of_interest[:end]

  path = []

  maze[start_point][DISCOVERED] = true
  point = start_point

  begin
    point = find_closest_undiscovered_valid_neighbor_point(point,maze)
    discover_neighbor(point, maze)
    path << point
  end until point == start_point || point.nil?
  path.pop
  path
end

#Second Try
def modify_queue(queue, neighbors)
  queue.each do |cell|
    neighbors.each do |n_cell|
      queue << n_cell unless n_cell[ROW] == cell[ROW] && n_cell[COL] == cell[COL] && n_cell[ROW] >= cell[ROW]
    end
  end
end

def find_non_wall_neighbors(cell,maze)
  points = possible_neighbors([cell[ROW],cell[COL]]).select do |neighbor|
    maze[neighbor][VALUE] != "*"
  end

  cells = []
  points.each do |point|
    cells << [point[ROW],point[COL],cell[COUNTER] + 1]
  end

  cells
end

#First Try
def find_closest_undiscovered_valid_neighbor_point(point, maze)
  possibilities = possible_neighbors(point).select do |neighbor|
    !maze[neighbor][DISCOVERED] && maze[neighbor][VALUE] != "*"
  end

  min_distance_neighbor = possibilities.min_by { |neighbor| maze[neighbor][DISTANCE_TO_END_POINT] }

  closest = possibilities.select do |neighbor|
    maze[neighbor][DISTANCE_TO_END_POINT] == maze[min_distance_neighbor][DISTANCE_TO_END_POINT]
  end

  closest.shuffle.sample
end

def discover_neighbor(point, maze)
  maze[point][DISCOVERED] = true
end

def possible_neighbors(point)
  # Assumption: Diagonal moves are not allowed
  [
    [point[0] - 1,point[1]],
    [point[0] + 1,point[1]],
    [point[0],point[1] - 1],
    [point[0],point[1] + 1],
  ]
end

def print_path(path, maze)
  path.each do |point|
    maze[point][VALUE] = "X"
  end

  rows = maze.max_by { |point, status| point[0] }
  cols = maze.max_by { |point, status| point[1] }

  maze_lines = Array.new(rows[0][0] + 1)

  maze_lines.map! do |row|
    row = Array.new(cols[0][1] + 1)
  end

  maze.each do |point, status|
    maze_lines[point[0]][point[1]] = status[VALUE]
  end

  maze_lines.each do |row|
    row.each do |col|
      print col
    end
    puts ""
  end
end

def find_path
  maze_lines = read_in_maze
  points_of_interest = find_start_and_end_points(maze_lines)
  maze = create_maze_graph(maze_lines, points_of_interest)
  shortest_path = path_finder(maze, points_of_interest)

  last = shortest_path.last
  shortest_path.delete(points_of_interest[:end])

  if last == points_of_interest[:end]
    print_path(shortest_path, maze)
  end

  last
end

maze_lines = read_in_maze
points_of_interest = find_start_and_end_points(maze_lines)
start_time = Time.now
begin
  result = find_path
  if Time.now - start_time > 5
    puts "No path found."
    break
  end
end until result == points_of_interest[:end]
