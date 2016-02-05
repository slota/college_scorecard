require 'csv'
require 'pry'

class CollegeScorecard
  def open_file
    CSV.open('data/2013_college_scorecards.csv', headers: true, header_converters: :symbol)
  end

  def by_state(args, csv)
    state_colleges = csv.select do |row|
      args[1] == row[:stabbr]
    end
    state_colleges.each { |row| puts row[:instnm] }
  end

  def top_average_faculty_salary(args, csv)
    state_colleges = csv.sort_by do |row|
      row[:avgfacsal].to_i
    end.reverse[0...(args[1].to_i)]
    state_colleges.each { |row| puts row[:instnm] }
  end

  def median_debt_between(args, csv)
    state_colleges = csv.select do |row|
      row[:grad_debt_mdn].to_i.between?(args[1].to_i, args[2].to_i)
    end
    sorted = state_colleges.sort_by { |row| row[:grad_debt_mdn] }.reverse
    sorted.each { |row| puts "#{row[:instnm]} ($#{row[:grad_debt_mdn]})" }
  end
end

if __FILE__ == $0
  college_scorecard = CollegeScorecard.new
  csv = college_scorecard.open_file
  college_scorecard.send(ARGV[0], ARGV, csv)
end
