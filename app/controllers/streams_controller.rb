require 'open-uri'
class StreamsController < ApplicationController
	def new 
		@stream = Stream.new
	end

	def create
	    @stream = Stream.new(params[:stream].permit(:source, :streamuri))
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
		@stream = Stream.find(params[:id])
		@href = Stream.checkOnline()
		#check other stream entries
		#else put up youtube ? 
	end	
	def index
		Stream.all.each do |stream| 
#
		end
		@streams = Stream.all
		
		#where_user_of_post_is_not_private
	
	end

end
#allow me to define stream (current casting place) (POST UPDATE)
#pop up only when live (UPDATE)
#hide if offline, nothing playing (Destroy?)
#title of stream!?
# OOOOO timelines!? Calender so i can tell website : I'll be doing this stream at xyz time 
# and have stream turn on/off during that time for front page...