class TagsController < ApplicationController
  def index
    @tags = Post.tag_counts
    @levels = (1 .. 5).map { |i| "level-#{i}" }
  end

  def show
    # This sets the posts and also paginates the output for showing a single tag.
    @posts = Post.paginate_tagged_with params[:id], :page => params[:page], :order => 'created_at DESC', :per_page => '5'
  end

end
