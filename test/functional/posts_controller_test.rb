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

	def test_should_reject_missing_post_attribute
		post :create, :post => { :title => 'test title' }
		assert assigns(:post).errors.on(:body)
	end

	def test_should_show_edit_form
		get :edit, :id => 1
		assert_response :success
		assert_template 'edit'
		assert_select 'form p', 3
	end

	def test_should_edit_post
		get :edit, :id => 1 

		assert_response :success
		assert_template 'edit'

		assert_not_nil assigns(:post)
		assert assigns(:post).valid?
	end

	def test_should_redirect_after_update
		post :update, :id => 1
		assert_response :redirect
		assert_redirected_to :action => 'show', :id => 1
	end

end