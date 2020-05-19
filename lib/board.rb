# frozen_string_literal: true

# Board class
class Board
  attr_accessor :layout
  attr_reader :width, :height, :empty, :directions

  def initialize
    @width = 7
    @height = 6
    @empty = '⚫'
    @layout = Array.new(height) { Array.new(width) { empty } }
    @directions = [[0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1]]
  end

  def to_s
    layout.each do |row|
      puts "|#{row.join('|')}|"
    end
    puts ' 1  2  3  4  5  6  7'
  end

  def win?(token)
    win = false
    height.times do |h|
      width.times do |w|
        if layout[h][w] == token && !win
          directions.each do |offset|
            temp_w = w
            temp_h = h
            counter = 0
            while counter < 3
              temp_w += offset[0]
              temp_h += offset[1]
              break if temp_w < 0 || temp_w > width - 1
              break if temp_h < 0 || temp_h > height - 1
              break if layout[temp_h][temp_w] != token
              counter += 1
            end
            win = true if counter == 3
          end
        end
        break if win
      end
      break if win
    end
    win
  end

  def valid_move?(move)
    return false if move > 6 || move < 0
    return false if layout[0][move] != empty
    true
  end

  def make_move(move, token)
    height.times do |i|
      row = height - i - 1
      if layout[row][move] == empty
        layout[row][move] = token
        break
      end
    end
  end

end
