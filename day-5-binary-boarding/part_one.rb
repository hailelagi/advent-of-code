board_passes = File.read('puzzle_input.txt').split(/\n/)

highest_seat_id = 0

for pass in board_passes
  row = 0
  column = 0
  lower_row = 0
  upper_row = 127
  search_rows = 128
  lower_column = 0
  upper_column = 7
  search_columns = 8

  pass.each_char do |c|
    search_rows = search_rows/2
    case c
    when "F"
      upper_row -= search_rows
    when "B"
      lower_row += search_rows
    when "L"
      search_columns /= 2
      upper_column -= search_columns
    when "R"
      search_columns /= 2
      lower_column += search_columns
    end
  end
  row += lower_row if lower_row == upper_row
  column += lower_column if lower_column == upper_column
  seat_id = (row * 8) + column

  highest_seat_id = seat_id if seat_id > highest_seat_id
end

p highest_seat_id