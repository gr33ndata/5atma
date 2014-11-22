require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "two users created" do
    users_count = User.all.size
    assert_equal 2, users_count, "Users in DB != 2"
  end

  test "user id and name are correct" do
    user = User.find_by(uid: "100001")
    assert_equal "User one", user.name, "Name incorrect for user 100001"
  end

  test "user id and email are correct" do
    user = User.find_by(uid: "100001")
    assert_equal "user1@email.com", user.email, "Email incorrect for user 100001"
  end

end
