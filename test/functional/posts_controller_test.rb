require 'test_helper'

class PostsControllerTest < ActionController::TestCase
	def test_should_show_index
		get :index
		assert_response :success
		assert_template 'index'
		assert_not_nil assigns(:posts)
	end

	def test_should_show_new
		get :new
		assert_response :success
		assert_template 'new'
		assert_not_nil assigns(:post)
	end

	def test_should_show_new_form
		get :new
		assert_select 'form p', :count => 3
	end

	def test_should_show_story
		post :create, :post => {
			:title => 'test post',
			:body => 'this is the test post body'}
		assert ! assigns(:post).new_record?
		assert_redirected_to posts_path 
		# assert_not_nil flash[:notice]
	end

end
