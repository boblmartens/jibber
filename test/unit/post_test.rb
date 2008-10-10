require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def test_should_create_post
		p = Post.create(
			:title => 'test post',
			:body => 'test post body')
		assert p.valid?
	end

end
