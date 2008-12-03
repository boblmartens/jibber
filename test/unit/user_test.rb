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

  should "be true" do
    assert true
  end

  context "a user" do
    setup do
      @user = User.new
      @user.email = 'test@test.com'
      @user.name = 'Test'
      @user.password = 'test'
      @user.save
    end

    should "have valid attributes" do
      assert_equal @user.name, 'Test'
      assert_equal @user.email, 'test@test.com'
    end

  end
end
