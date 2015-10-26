require 'open-uri'
class Stream < ActiveRecord::Base
	def set_stream_live?
	 	if last_time_checked < (Time.now - 2*60)
	 		Stream.find_streams_online
	 		last_time_checked = Time.now
 		end
 		if Stream.find_streams_online.include?(self)
 			return true
		else
			return false
		end
	end

	def self.find_streams_online
		Stream.all.select do |stream|
			stream.checkOnline?
		end
	end


	def last_time_checked
		@last_time_checked ||= ( Time.now - 2*60)
	end 

	def checkOnline?
		nokogiri_scrape = Nokogiri::HTML(open(self.stream_api_url))
		nokogiri_scrape.text.match(self.text_to_scrape)
	end
	#function to check last time stream was checked
	#function to check if that time = 1 minute ago
	#function to check if stream is live
end

	#"http://streamapi.majorleaguegaming.com/service/streams/status/mlg302?callback=callback"	
