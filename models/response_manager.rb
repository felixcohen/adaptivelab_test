class ResponseManager

  def fetch_responses(existing_ids)
  	url = 'http://adaptive-test-api.herokuapp.com/tweets.json'
  	content = open(url).read
	results = JSON.parse(content)
	results = self.parse_responses(results,existing_ids)
	return results.to_json
  end

  def parse_responses(results,existing_ids)
  	return results
  end
end