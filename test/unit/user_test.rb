require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_have_many :posts
  should_have_many :comments
  should_require_attributes :email, :name
  should_require_unique_attributes :email

  context "creating a new user" do
    setup do
      @users = User.all
      @user = User.new
    end

    context "without valid attributes" do
      setup do
        @user.save
      end

      should "not create valid record" do
        assert_equal @users.size, 2
      end
    end

    context "with valid attributes" do
      setup do
        @user.name = "Test Name"
        @user.email = "test@email.com"
        @user.password = "password"
        @user.save
      end

      should "create valid record" do
        assert_valid @user

        @new_users = User.all
        assert_equal @new_users.size, @users.size + 1
      end

      should "not save plain-text password to the database" do
        assert_not_equal User.last.password_hash, @user.password
        assert_not_equal User.last.password_salt, @user.password
      end
    end
  end
end
