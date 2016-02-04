require 'csv'
require 'pry'
# require_relative "2013_college_"


class CollegeScorecard
  def open_file
    var = CSV.open('../data/2013_college_scorecards.csv', headers: true, header_converters: :symbol)
    return_value = var.select do |row|
      ARGV[1] == row[:stabbr]
    end
  return_value.each { |row| puts row[:instnm] }
  end
end

if __FILE__ == $0
  CollegeScorecard.new.open_file
end
