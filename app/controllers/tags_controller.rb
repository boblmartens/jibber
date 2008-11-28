class TagsController < ApplicationController
  def index
    @tags = Tag.find(:all)
    @css = ['css1', 'css2']
  end

  def show
    @posts = Post.find_tagged_with(params[:id])
  end

end
