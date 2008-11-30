class TagsController < ApplicationController
  def index
    @tags = Post.tag_counts
    @levels = (1 .. 5).map { |i| "level-#{i}" }
  end

  def show
    @posts = Post.find_tagged_with(params[:id])
  end

end
