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

  
end