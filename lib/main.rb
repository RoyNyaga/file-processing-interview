require "./services/file_processor.rb"
require "./services/handle_request.rb"

raw_file_data = File.open("./assets/personality_test_results.txt").readlines.map(&:chomp)

puts raw_file_data