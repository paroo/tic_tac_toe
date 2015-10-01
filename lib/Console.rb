#!/usr/bin/env ruby

module TicTacToe
  class Console
    POSSIBLE_MOVE = ["X", "O"]

    attr_accessor :console, :horizontal_line, :vertical_line, :diagonal_line, :selected_cells, :values, :concole_entry

    def initialize	    
      @console = Hash[(0..8).map { |x| [x, ""] }]
      @values = @console.values
      @concole_entry = @console.keys
      @horizontal_line = @concole_entry.each_slice(3).to_a
      @vertical_line = @horizontal_line.transpose
      @diagonal_line = []
      @diagonal_line << (0..8).step(4).map { |x| x}
      @diagonal_line << 3.times.map { |x| (x * 2 ) +2}
    end

    def get_empty_entry
      @values.map { |x| x if x.empty? }
    end

    def board_full?
      !field.any?{|v| v.nil?}
    end

    def get_winning_player
      winning_solutions = []
      horizontal_line.each { |x| winning_solutions << x }       
      vertical_line.each { |x| winning_solutions << x }       
      diagonal_line.each { |x| winning_solutions << x }       
	    
      winning_solutions.each do |winning_solution|
        winner = []
	winning_solution.each do |entries|
          winner << console[entries] if !console[entries].empty?
    	  return winner.first if winner.size == 3 && !winner.uniq!.nil?
	end
      end

      false
    end

    def is_game_over?
      @values.any?{ |x| x.empty? } || !get_winning_payer
    end

    def player_move(player_entry, player)
      @console[player_entry] = player
    end

    def to_s
      @horizontal_line.each do |horizontal_line|
        puts (horizontal_line.map{ |entry| @values[entry].empty? ? "_" :  @values[entry]}).join(" | ")
      end
    end
  end
end


