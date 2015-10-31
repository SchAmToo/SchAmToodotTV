class StreamsController < ApplicationController
	def new
		@stream = Stream.new
	end
	def create
	    @stream = Stream.new(params[:stream].permit(:source, :streamuri, :stream_api_url, :toggle_live, :text_to_scrape))
	    @stream.save
	end
	def update
		@stream = Stream.find(params[:id])
		@stream.update(params[:stream].permit(:source, :streamuri, :stream_api_url, :toggle_live, :text_to_scrape))
		redirect_to streams_path
	end
	def destroy
		@stream = Stream.find(params[:id])
		@stream.destroy
	end
	def show 
		#check mlg
		@stream = Stream.find(params[:id])	
		
	end	
	def index
		@streams = Stream.all
	end

end
#allow me to define stream (current casting place) (POST UPDATE)
#pop up only when live (UPDATE)
#hide if offline, nothing playing (Destroy?)
#title of stream!?
# OOOOO timelines!? Calender so i can tell website : I'll be doing this stream at xyz time 
# and have stream turn on/off during that time for front page...