require 'test_helper'

class ChapterTest < ActiveSupport::TestCase

  test "two chapters created" do
    chapters_count = Chapter.all.size
    assert_equal 2, chapters_count, "Chapters in DB != 2"
  end

end
