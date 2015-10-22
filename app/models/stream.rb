require 'open-uri'
class Stream < ActiveRecord::Base
	
	def self.live_stream_set_at 
	 	@live_stream_set_at ||= Time.now 
	end

	def self.current_live_stream 
	 	if live_stream_set_at < (Time.now - 2*60) 
	 		@live_stream = set_live_stream 
	 	end 
	 	@live_stream 
	end

	def self.set_live_stream 
	 	streams.each do |stream| 
	 		next unless stream.checkOnline(stream.source)
	 		@live_stream_set_at = Time.now 
	 	end
	end 
	
	#function to check last time stream was checked
	
	#function to check if that time = 1 minute ago
	#function to check if stream is live
end

