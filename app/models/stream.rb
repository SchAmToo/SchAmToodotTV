require 'open-uri'
class Stream < ActiveRecord::Base

	def self.checkOnline()
		
		mlgstreamapi = "http://streamapi.majorleaguegaming.com/service/streams/status/mlg302?callback=callback"
		mlg = Nokogiri::HTML(mlgstreamapi)
		if mlg.text.match('2') 
			return "http://tv.majorleaguegaming.com/player/embed/schamtoo"
		else
			return "https://www.youtube.com/embed/cEJhLiFhz1k"
		end
	end
end
