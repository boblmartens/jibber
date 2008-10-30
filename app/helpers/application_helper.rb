# Methods added to this helper will be available to all templates in the application.
require 'rdiscount'

module ApplicationHelper
def markdown(text)
	text.blank? ? "" : RDiscount.new(text).to_html
end

end
