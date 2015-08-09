class Tag < ActiveRecord::Base
  validates_presence_of :name
  scope :starts_with, ->(prefix) { where("lower(name) LIKE ?", "#{prefix.downcase}%").order(name: :asc) }
end
