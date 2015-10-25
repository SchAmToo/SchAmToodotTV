require 'open-uri'
class Stream < ActiveRecord::Base
	def set_stream_live?
	 	p last_time_checked
	 	#if the value of time from last it was checked is a higher number than current time - 2 minutes (I.e. if it happened < 2 minutes ago)

	 	if (last_time_checked > (Time.now - 2*60)) && (is_stream_live)
	 		return true
	 	else
	 	#if 2 minutes ago is a greater value than the last it was checked 
	 		if (last_time_checked < (Time.now - 2*60))
	 				last_time_checked = Time.now
		 			if checkOnline?
		 				is_stream_live = true
		 				return true
		 			else
		 				is_stream_live = false
		 				return false
	 				end
	 		else
	 			return false
	 		end
 		end

 		# if last time check was recent and the stream was LIVE last it was checked, true.
 		# if the last time checked expired, check stream again, if it's live, true. set the last time checked to now.
 		# if both those weren't true, we just checked again, still false. return false. 


	end

	def last_time_checked
		@last_time_checked ||= ( Time.now - 2*60)
	end 
	def is_stream_live
		@is_stream_live ||= false
	end
	def checkOnline?
		p "Nokogiri"
		nokogiri_scrape = Nokogiri::HTML(open(self.stream_api_url))
		nokogiri_scrape.text.match(self.text_to_scrape)
	end
	#function to check last time stream was checked
	#function to check if that time = 1 minute ago
	#function to check if stream is live
end

	#"http://streamapi.majorleaguegaming.com/service/streams/status/mlg302?callback=callback"	
