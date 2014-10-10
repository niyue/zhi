class MultipleChoice < ActiveRecord::Base
  has_many :choices, :dependent => :destroy
  has_many :parts, :as => :question
  accepts_nested_attributes_for :choices, 
    :reject_if => lambda { |c| c[:description].blank? }, :allow_destroy => true
end
