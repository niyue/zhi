require 'test_helper'

class MultipleChoiceTest < ActiveSupport::TestCase
  test "retrieve all multiple choices" do
    mc = MultipleChoice.all
    assert mc.length > 0
  end
end
