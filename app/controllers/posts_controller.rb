class PostsController < ApplicationController
  def index
		@posts = Post.find :all, :order => 'id DESC'
  end

	def show
		@post = Post.find(params[:id])
	end

  def new
		@post = Post.new
  end

	def create
		@post = Post.new(params[:post])

		if @post.save
			redirect_to posts_path
		else
			render :action => 'new'
		end
	end

end
