require 'open-uri'
module StreamsHelper
	def checkOnline(stream_source)
		@stream_to_check = Stream.find_by_source(stream_source)
		if stream_source.match("mlg.tv")
			mlg_stream_api = open("http://streamapi.majorleaguegaming.com/service/streams/status/mlg302?callback=callback")
			mlg_nokogiri = Nokogiri::HTML(mlg_stream_api)
			if mlg_nokogiri.text.match('"status": 1') 
				return "<i class = 'glyphicon glyphicon-play' ></i>".html_safe
			else
				return "<i class = 'glyphicon glyphicon-pause' ></i>".html_safe
			end
		elsif stream_source.match("twitch.tv")
			twitch_stream_api = open("https://api.twitch.tv/kraken/streams/schamtoo")
			twitch_nokogiri = Nokogiri::HTML(twitch_stream_api)
			if twitch_nokogiri.text.match('"stream":null')
				return "<i class = 'glyphicon glyphicon-pause' ></i>".html_safe
			else
				return "<i class = 'glyphicon glyphicon-play' ></i>".html_safe
			end
		end
	end
end
