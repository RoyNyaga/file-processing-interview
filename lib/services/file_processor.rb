require 'json'
require 'httparty'
require "Titleize"

class FileProcessor
  attr_accessor :data

  def initialize(data)
    @data = data
 end

  @@domains = ["EXTRAVERSION", "AGREEABLENESS", "CONSCIENTIOUSNESS", 
    "NEUROTICISM", "OPENNESS TO EXPERIENCE"]
  @@domain_in_context = ""

  def create_hash
    hashed_data = {"NAME"=>"Roy Nyaga Andre", "EMAIL"=>"nyagaandreroy@gmail.com"}
    @data.each do |line| 
      line_type = detect_line_type(line)
      if detect_line_type(line) == "description" then 
        next 
      elsif detect_line_type(line) == "domain" then
        @@domain_in_context = extract_first_word(line)
        hashed_data["#{@@domain_in_context}"] = {}
        hashed_data["#{@@domain_in_context}"]["Overall Score"] = extract_score(line)
        hashed_data["#{@@domain_in_context}"]["Facets"] = {}
      elsif detect_line_type(line) == "facet" then
        hashed_data["#{@@domain_in_context}"]["Facets"]["#{extract_first_word(line)}"] = extract_score(line)
      end 
    end 
    return hashed_data
  end

  def extract_score(line)
    return line.split(".").last.to_i
  end

  def extract_first_word(line)
    return line.split(".").first
  end

  def detect_line_type(line)
    last_word = line.split(".").last.strip
    first_word = line.split(".").first
    if last_word == "Score" then 
      return "description"
    elsif @@domains.include?(first_word) then 
      return "domain"
    else
      return "facet"
    end 
  end 
  
end