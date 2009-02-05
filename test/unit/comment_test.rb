require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  should_belong_to :post
  should_validate_presence_of :body

  context "a comment" do
  end
end
