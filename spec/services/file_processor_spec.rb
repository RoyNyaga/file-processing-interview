require "./lib/services/file_processor.rb"

RSpec.describe FileProcessor do
  before do 
    @raw_file_data = File.open("./lib/assets/personality_test_results.txt").readlines.map(&:chomp)
    @file_processor = FileProcessor.new(@raw_file_data)
  end

  describe "when calling the extract_score method" do
    it "returns an integer" do 
      score = @file_processor.extract_score("EXTRAVERSION.........70")
      expect(score).to eq(70)
    end 
  end

  describe "when calling the extract_first_word method" do 
    it "returns first word" do 
      word = @file_processor.extract_first_word("EXTRAVERSION........70")
      expect(word).to eq("EXTRAVERSION")
    end 
  end 

  describe "when caling the detect_line_type method" do 
    describe "when the line is a description" do 
      it "return description" do 
        type = @file_processor.detect_line_type("Domain/Facet...... Score")
        expect(type).to eq("description")
      end 
    end

    describe "when line is a trait" do 
      it "returns domain" do 
        type = @file_processor.detect_line_type("OPENNESS TO EXPERIENCE...56")
        expect(type).to eq("domain")
      end 
    end 

    describe "when line is a facet" do 
      it "returns facet" do 
        type = @file_processor.detect_line_type("Imagination..............72")
        expect(type).to eq("facet")
      end 
    end 
  end 

  describe "when calling the create_hash method" do 
    it "returns a hashed object" do 
      expect(@file_processor.create_hash.is_a?(Hash)).to eq true
    end 
  end 
end