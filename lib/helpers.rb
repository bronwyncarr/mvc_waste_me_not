module Helpers
  include Constants

  def CreateTable(variable)
    formatted_list = variable.map do |item|
      ing = item[2].join(", ")
      [item[0], item[1], ing]
    end
    table = TTY::Table.new(TABLE_HEADING, formatted_list)
    puts table.render(:ascii, alignment: [:center], resize: true)
  end
  
end