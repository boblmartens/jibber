class CommentsController < ApplicationController
  before_filter :load_post
  before_filter :login_required, :only => [ :edit, :updated, :destroy ]

	def load_post
		@post = Post.find(params[:post_id])
	end
	
  def new
    @comment = @post.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def create
    @comment = @post.comments.build(params[:comment])
    
    if @current_user
      @comment.user_id = @current_user.id
      @comment.name = @current_user.name
      @comment.email = @current_user.email
      @comment.homepage = @current_user.homepage
    else
      false
    end

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(post_path(@post)) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(@post) }
      format.xml  { head :ok }
    end
  end

end
