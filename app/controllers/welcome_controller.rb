require 'open-uri'

class WelcomeController < ApplicationController
  	def index
  		@posts = Post.find(:all, :order => "id desc", :limit => 5)
  		@stream = Stream.last
  	end

  	def frontpage
  		@posts = Post.find(:all, :order => "id desc", :limit => 5)
  	end

  	def show
  	  	@posts = Post.find(:all, :order => "id desc", :limit => 5)
  		@stream = Stream.checkOnline(Stream.last)
  	end
    def resume
      file = open("https://s3-us-west-2.amazonaws.com/schamtoo.com/KevinPearson-Resume.pdf")
      send_file(file, :filename => "KevinPearson-Resume.pdf", :type => "application/pdf" , :disposition => "inline")
    end

end
