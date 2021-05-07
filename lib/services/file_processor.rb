require 'json'
require 'httparty'

class FileProcessor
  attr_accessor :data

  def initialize(data)
    @data = data
 end

  @@domains = ["Extraversion", "Agreeableness", "Conscientiousness", 
    "Neuroticism", "Openness To Experience"]
  @@domain_in_context = ""


  

  private 

  def extract_score(line)
    return line.split(".").last.to_i
  end

  def extract_first_word(line)
    return line.split(".").first.gsub(" ","-")
  end

  def detect_line_type(line)
    last_word = line.split(".").last.strip
    first_word = line.split(".").first.gsub(" ", "-")
    if last_word == "Score" then 
      return "description"
    elsif @@domains.include?(first_word) then 
      return "domain"
    else
      return "facet"
    end 
  end 

  
end