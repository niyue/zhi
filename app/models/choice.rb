class Choice < ActiveRecord::Base
  belongs_to :multiple_choice
  validates_presence_of :description
end
