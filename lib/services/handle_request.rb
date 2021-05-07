class HandleRequest 
  include HTTParty
  @@uri = 'https://recruitbot.trikeapps.com/api/v1/roles/bellroy-tech-team-recruit/big_five_profile_submissions'

  

  def self.post_json_data(hashed_data)
    options = {
      body: hashed_data.to_json,
      headers: { "Content-Type" => "application/json"}
    }

    response = HTTParty.post(@@uri, options)
    puts response 
  end 
end 