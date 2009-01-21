require 'rdiscount'
require 'digest/md5' 

module ApplicationHelper
def markdown(text)
	text.blank? ? "" : RDiscount.new(text).to_html
end

def user?
  if @current_user
    return true
  else
    return false
  end
end

def gravatar_url_for(email, options = {})
  url_for({ :gravatar_id => Digest::MD5.hexdigest(email), 
            :host => 'www.gravatar.com',
            :protocol => 'http://', 
            :only_path => false, 
            :controller => 'avatar.php'}.merge(options))  
end

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
