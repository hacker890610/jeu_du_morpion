class BoardCase
    attr_accessor :index, :column, :row, :player
  
    def initialize(index, row, column, player = false)
      @index = index
      @row = row
      @column = column
      @player = player
    end
  end