class ResponseManager

  def fetch_responses(existing_ids)
  	begin
	  	url = 'http://adaptive-test-api.herokuapp.com/tweets.json'
	  	content = open(url).read
		results = JSON.parse(content)
		if !existing_ids.nil?
			results = self.parse_responses(results,existing_ids)
		end
		results.each do |result| 
			if (Message.find_by_id(result["id"]).nil?)
				m = Message.new(result)
				m.id = result["id"]
				m.save
			end
		end
		return results.to_json
	rescue OpenURI::HTTPError => ex
      return "The API is unavailable"
    end 
  end

  def parse_responses(results,existing_ids)
  	return results.reject { |result| existing_ids.include? result["id"].to_s }
  end
end