class HandleRequest 
  include HTTParty
  URL = 'https://recruitbot.trikeapps.com/api/v1/roles/bellroy-tech-team-recruit/big_five_profile_submissions'

  def self.post_json_data(json_data)
    options = {
      body: json_data,
      headers: { "Content-Type" => "application/json" }
    }

    begin 
      response = HTTParty.post(URL, options)
    rescue StandardError => e 
      return "request could not be effected: #{e.message}"
    end
    return response.body
  end 
end 