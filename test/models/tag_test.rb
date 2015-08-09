require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test 'get all tags' do
    tags = Tag.all
    assert tags.length > 0
    for tag in tags
      assert tag.name
    end
  end
  
  test 'get tags starting with' do
    tags = Tag.starts_with('d')
    assert_equal 2, tags.length
    assert_equal 'data_structure', tags[0].name
    assert_equal 'dynamic_programming', tags[1].name
  end
end
