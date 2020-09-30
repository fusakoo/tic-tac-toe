# Defines user selection

class Selection
  attr_accessor :row, :column

  def initialize(row, column)
    @row = row
    @column = column
  end
end
