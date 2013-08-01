class ResponseManager

  def fetch_responses(existing_ids)
  	begin
	  	url = 'http://adaptive-test-api.herokuapp.com/tweets.json'
	  	content = open(url).read
		results = JSON.parse(content)
		results = self.parse_responses(results,existing_ids)
		return results.to_json
	rescue OpenURI::HTTPError => ex
      return "The API is unavailable".to_json
    end 
  end

  def parse_responses(results,existing_ids)
  	return results
  end
end