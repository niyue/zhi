require 'test_helper'

class MultipleChoiceTest < ActiveSupport::TestCase
  test 'retrieve all multiple choices' do
    mc = MultipleChoice.all
    assert mc.length > 0
  end
  
  test 'save tags' do
    mc = multiple_choices(:inorder_traversal)
    mc.tag_list.add('data_structure', 'traversal', 'tree')
    mc.save
    mc.reload
    tags = mc.tags
    assert tags.length >= 3
  end
end
