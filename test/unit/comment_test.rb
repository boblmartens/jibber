require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  should_belong_to :post
  should_validate_presence_of :body

  context "a new comment" do
    should "be saved when including a body" do
      assert_valid Comment.new(:body => "this is a comment body")
    end

    should "not be saved when not including a body" do
      assert_equal Comment.new.save, false
    end

    should "have default name if none is given" do
      assert_equal "A Shiftless Shadow", Comment.first.commenter_name
    end
  end
end
