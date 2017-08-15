class Group < ApplicationRecord
  belongs_to :user
  has_many :groupitems
  validates_each :groupitems do |group,attr,value|
    group.errors.add attr, "too much monitors limit 8" if group.groupitems.size > 8
  end
end
