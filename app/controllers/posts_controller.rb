class PostsController < ApplicationController
	def new
		@post = Post.new
	end
	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :text, :remote_url, :blurb))
			redirect_to @post
		else
			render 'edit'
		end
	end
	def create
		@post = Post.new(params[:post].permit(:title, :text, :remote_url, :blurb))
  		@post.user = current_user
		if @post.save
			redirect_to @post
		else
			render 'new'
		end

	end
	def edit
		@post = Post.find(params[:id])
	end
	
	def show 
		if Post.find_by_id(params[:id]).nil? 
        	redirect_to action: :index
      	else
        	@post = Post.find_by_id(params[:id])
      	end
	end
	
	def index
		User.all.each do |user| 
			if user.privacy.nil?
				#@posts += Posts.find_by_id(user)
			end
		end
		@posts = Post.all
		
		#where_user_of_post_is_not_private
	
	end
    
    def destroy
                @post = Post.find(params[:id])
                @post.destroy
                redirect_to posts_path
    end
	private
	def post_params
		params.require(:post).permit(:title, :text)
	end
end
