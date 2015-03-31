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

#		if Stream.find_by_id(params[:id]).nil?
#			redirect_to action: :create
#		else
		@stream = Stream.find_by_id(params[:id])
#		end
		#divid = channel_190
		doc = Nokogiri::HTML(open(@stream.streamuri))
		@href = doc.css('div#channel div#channels')
#		@href = doc.css('#capstone #container #subcontainer #channel div#channels').element_children.text
		#if Stream.find_by_id(params[:id]).nil? 
        #	redirect_to action: :index
      	#else
        # 	@stream = Stream.find_by_id(params[:id])
      	#end
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