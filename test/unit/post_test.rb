require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def test_should_create_post
		p = Post.create(
			:title => 'test post',
			:body => 'test post body')
		assert p.valid?
	end

	def test_should_not_create_without_title
		p = Post.create(
			:title => nil,
			:body => 'failed test')
		assert p.errors.on(:title)
	end

	def test_should_not_create_without_body
		p = Post.create(
			:title => 'title',
			:body => nil)
		assert p.errors.on(:body)
	end

	def test_should_update_post_attributes
		p = Post.update(1, :title => 'test title')
		assert p.title, 'test title'
	end

	def test_should_delete_post
		p = Post.find(:first)
		p.destroy
		assert p, nil
	end

end
