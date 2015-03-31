class WelcomeController < ApplicationController
  	def index
  		@posts = Post.find(:all, :order => "id desc", :limit => 5)
  		@stream = Stream.last
  	end

  	def frontpage
  		@posts = Post.find(:all, :order => "id desc", :limit => 5)
  		@stream = Stream.last
  	end

  	def show
  	  	@posts = Post.find(:all, :order => "id desc", :limit => 5)
  		@stream = Stream.last
  	end
end
