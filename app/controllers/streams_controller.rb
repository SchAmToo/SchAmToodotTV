class StreamsController < ApplicationController
	def new
		@stream = Stream.new
	end
	def create
	    @stream = Stream.new(params[:stream].permit(:source, :streamuri, :stream_api_url, :toggle_live, :text_to_scrape))
	    @stream.save
		redirect(action: "show", id: tag.id)
	end
	def update
		@stream = Stream.find(params[:id])
		@stream.update(params(:source, :streamuri))
	end
	def destroy
		@stream = Stream.find(params[:id])
		@stream.destroy
	end
	def show 
		#check mlg
		@stream_test = Stream.find(params[:id]).streamuri
		@href = Stream.checkOnline(Stream.last)
		#check other stream entries
		#else put up youtube ? 
		#build list of all streams. 1 twitch, 1 youtube, 1 mlg ? 
		#stream
		@twitch_stream = Stream.find_by_source("twitch.tv").streamuri
		@mlg_stream = Stream.find_by_source("mlg.tv").streamuri
		@youtube_video = Stream.find_by_source("youtube.com").streamuri
	end	
	def index
		Stream.all.each do |stream| 
	end
	def stream_window
		@twitch_stream = Stream.find_by_source("twitch.tv").streamuri
		@mlg_stream = Stream.find_by_source("mlg.tv").streamuri
		@youtube_video = Stream.find_by_source("youtube.com").streamuri
	end
	def tab_of_streams
		respond_to do |format|
			application.js
		end
	end
end

#allow me to define stream (current casting place) (POST UPDATE)
#pop up only when live (UPDATE)
#hide if offline, nothing playing (Destroy?)
#title of stream!?
# OOOOO timelines!? Calender so i can tell website : I'll be doing this stream at xyz time 
# and have stream turn on/off during that time for front page...