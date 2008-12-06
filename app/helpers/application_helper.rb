require 'rdiscount'

module ApplicationHelper
def markdown(text)
	text.blank? ? "" : RDiscount.new(text).to_html
end

def admin?
  if @current_user.admin == true
    return true
  else
    return false
  end
end

def user?
  if @current_user
    return true
  else
    return false
  end
end

end
