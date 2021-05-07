class HandleRequest 
  include HTTParty
  @@uri 'https://recruitbot.trikeapps.com/api/v1/roles/bellroy-tech-team-recruit/big_five_profile_submissions'

  @@options = {
    body: hashed_data.to_json,
    headers: { "Content-Type" => "application/json"}
  }

  def self.post_json_data 
    response = HTTParty.post(@@uri, @@options)
    puts response 
  end 
end 