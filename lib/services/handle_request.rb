class HandleRequest 
  include HTTParty
  @@uri = 'https://recruitbot.trikeapps.com/api/v1/roles/bellroy-tech-team-recruit/big_five_profile_submissions'

  def self.post_json_data(json_data)
    options = {
      body: json_data,
      headers: { "Content-Type" => "application/json" }
    }

    response = HTTParty.post(@@uri, options)
    return response.body
  end 
end 