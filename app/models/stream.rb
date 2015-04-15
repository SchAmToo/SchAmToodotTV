require 'open-uri'
class Stream < ActiveRecord::Base

	def self.checkOnline()
		
		mlgstreamapi = open("http://streamapi.majorleaguegaming.com/service/streams/status/mlg302?callback=callback")

		mlg = Nokogiri::HTML(mlgstreamapi)		

		if mlg.text.match('"status": 1') 
			return "http://tv.majorleaguegaming.com/player/embed/schamtoo"
		else
			return "https://www.youtube.com/embed/cEJhLiFhz1k"
		end
	end
end

# https://api.twitch.tv/kraken/streams/milktea <--- stream: null == offline
#		twitch = open("https://api.twitch.tv/kraken/streams/shaboozey")
#		regextwitch = pullviewers.text.match(/"viewers":(\d*?),/)[1]
