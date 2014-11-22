require 'test_helper'

class KhatmaTest < ActiveSupport::TestCase

  test "two khatmas created" do
    khatmas_count = Khatma.all.size
    assert_equal 2, khatmas_count, "Khatmas in DB != 2"
  end

end
