require 'json'
require "./lib/services/file_processor.rb"
require "./lib/services/handle_request.rb"


RSpec.describe HandleRequest do
  describe "when calling post_json_data" do 
    it "return" do 
      raw_file_data = File.open("./lib/assets/personality_test_results.txt").readlines.map(&:chomp)
      file_processor = FileProcessor.new(raw_file_data)
      hashed_data = file_processor.create_hash
      json_data = hashed_data.to_json
      response = HandleRequest.post_json_data(json_data)
      expect(response).to eq("Email has already been taken")
    end 
  end
end