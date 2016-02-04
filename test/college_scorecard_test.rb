require "minitest/autorun"
require_relative "../lib/college_scorecard"
require 'pry'

class CollegeScorecardTest < Minitest::Test
  def test_college_scorecard_works
    var = CollegeScorecard.new
    binding.pry
  end
end
