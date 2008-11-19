class PostsController < ApplicationController
  before_filter :login_required, :except => [ :index, :show ]
  before_filter :post_creator, :only => [ :edit, :update ]

  def index
		@posts = Post.find :all, :order => 'id DESC'
  end

	def show
		@post = Post.find(params[:id])
	end

  def new
		@post = Post.new
  end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(params[:post])
    @post.user_id = session[:user_id]

		if @post.save
			redirect_to posts_path
		else
			render :action => 'new'
		end
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to post_path
		else
			render :action => 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

  protected

  def post_creator?
    @post = Post.find(params[:id])
    if @current_user
      return true if session[:user_id] == @post.user_id 
      redirect_to posts_path and return false
    else
       false
     end
  end

end
