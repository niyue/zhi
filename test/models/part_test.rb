require 'test_helper'

class PartTest < ActiveSupport::TestCase
  test 'has dependent' do
    assert Part.has_dependent?(multiple_choices(:skip_list))
  end
  
  test 'has no dependent' do
    assert !Part.has_dependent?(multiple_choices(:probability))
  end
end
