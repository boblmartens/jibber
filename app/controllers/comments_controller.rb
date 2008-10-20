class CommentsController < ApplicationController
  before_filter :load_post

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
    @comment = @post.comments.find
  end

  def create
    @comment = @post.comments.build

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to([@post, @comment]) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @comment = @post.comments.find

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to([@post, @comment]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @post.comments.find
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(post_url) }
      format.xml  { head :ok }
    end
  end
end
