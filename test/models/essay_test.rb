require 'test_helper'

class EssayTest < ActiveSupport::TestCase
  test 'save tags' do
    q = essays(:permutation)
    q.tag_list.add('probability', 'math')
    q.save
    q.reload
    tags = q.tags
    assert tags.length >= 2
  end
  
  test 'load tagged essay questions' do
    tagged_essays = Essay.tagged_with(['probability'])
    assert tagged_essays.length > 0, "there should be at least one question with this tag"
  end
end
