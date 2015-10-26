require 'open-uri'
class Stream < ActiveRecord::Base

 	def self.cache_stale?
 		last_time_checked < (Time.now - 2*60)
 	end

 	def self.live_streams
 		if cache_stale?
	 		@live_streams = Stream.find_online_streams
	 		last_time_checked = Time.now
 		end
 		@live_streams
 	end

	def self.find_online_streams
		Stream.all.select do |stream|
			stream.is_live?
		end
	end

	def self.last_time_checked=(value)
		@last_time_checked=value
	end

	def self.last_time_checked
		@last_time_checked ||= ( Time.now - 2*60)
	end 

	def is_live?
		nokogiri_scrape = Nokogiri::HTML(open(self.stream_api_url))
		nokogiri_scrape.text.match(self.text_to_scrape)
	end
	#function to check last time stream was checked
	#function to check if that time = 1 minute ago
	#function to check if stream is live
end

	#"http://streamapi.majorleaguegaming.com/service/streams/status/mlg302?callback=callback"	
