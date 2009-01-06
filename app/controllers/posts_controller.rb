class PostsController < ApplicationController
  before_filter :login_required, :except => [ :index, :show ]

  def index
		# @posts = Post.find :all, :order => 'id DESC'
    @posts = Post.paginate :page => params[:page], :order => 'created_at DESC', :per_page => '5'
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
      flash[:notice] = "post created succecssfully"
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
end
