require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "user name saved" do
    u = User.create(:email => 'boblmartens@gmail.com', :name => 'bob')
    assert u.valid?
    assert_equal users(:one).name, 'bob'
  end
end
