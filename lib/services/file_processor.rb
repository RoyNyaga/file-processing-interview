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

  
end