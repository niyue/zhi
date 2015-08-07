class Essay < ActiveRecord::Base
  validates_presence_of :name
  has_many :parts, :as => :question
  acts_as_taggable
end
