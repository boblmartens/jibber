require 'test_helper'

class PostTest < ActiveSupport::TestCase
  should_belong_to :user
  should_have_many :comments, :dependent => :destroy
  should_validate_presence_of :body, :title, :tag_list
  should_have_named_scope :by_creation_date, :order => 'created_at DESC'

  context "a new post" do
    setup do
      @post = Post.new
      @post.title = "this is a title"
      @post.body = "this is a body"
      @post.tag_list = "tag"
      @post.user_id = 1
      @post.save
    end

    should "have the correct pretty_date" do
      assert_equal @post.pretty_date, @post.created_at.strftime("%b %d, %Y")
    end
  end
end
