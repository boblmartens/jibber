module PostsHelper

def commaed_tags(post)
  @tags = ""
  post.tags.each do |tag|
    if tag.name == post.tags.first.name
      @tags << link_to(tag.name, tag_path(:id => tag.name))
    elsif tag.name != @post.tags.last.name
      @tags << ", " + link_to(tag.name, tag_path(:id => tag.name)) 
    else 
      @tags << " and " + link_to(tag.name, tag_path(:id => tag.name))
    end
  end

  @tags
end
end
