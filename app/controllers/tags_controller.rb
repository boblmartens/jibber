class TagsController < ApplicationController
  def index
    @tags = Post.tag_counts
    @levels = (1 .. 5).map { |i| "level-#{i}" }
  end

  def show
    # @posts = Post.find_tagged_with(params[:id])
    # This sets the posts and also paginates the output for showing a single tag.
    @posts = Post.tagged_with(params[:id], :on => :tags).by_creation_date.paginate(:page => params[:page], :per_page => '5')
  end

end
