require 'csv'
require 'pry'

class CollegeScorecard
  def open_file
    CSV.open('data/2013_college_scorecards.csv', headers: true, header_converters: :symbol)
  end

  def by_state(csv)
    state_colleges = csv.select do |row|
      ARGV[1] == row[:stabbr]
    end
    state_colleges.each { |row| puts row[:instnm] }
  end
end

if __FILE__ == $0
  college_scorecard = CollegeScorecard.new
  csv = college_scorecard.open_file
  college_scorecard.send(ARGV[0], csv)
end
