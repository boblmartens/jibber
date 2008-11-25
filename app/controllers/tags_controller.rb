class TagsController < ApplicationController
  def show
    @posts = Post.find_tagged_with(params[:id])
  end

end
