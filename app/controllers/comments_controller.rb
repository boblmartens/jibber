class CommentsController < ApplicationController
  before_filter :load_post
  before_filter :login_required, :only => [ :edit, :updated, :destroy ]
  before_filter :comment_creator, :only => [ :edit, :update ]

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

  def edit
    # @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = @current_user.id

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

  def update
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to([@post]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
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

  protected

  def comment_creator
    @comment = @post.comments.find(params[:id])
    return true if @current_user.id == @comment.user_id || is_admin 
    redirect_to posts_path and return false
  end

end
