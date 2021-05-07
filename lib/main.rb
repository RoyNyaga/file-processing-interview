require "./services/file_processor.rb"
require "./services/handle_request.rb"

raw_file_data = File.open("./assets/personality_test_results.txt").readlines.map(&:chomp)

file_processor = FileProcessor.new(raw_file_data)
hashed_data = file_processor.create_hash

p hashed_data