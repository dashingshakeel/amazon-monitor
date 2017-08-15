class Groupitem < ApplicationRecord
  belongs_to :group
  belongs_to :item
  has_many :logs

  validates  :item_id, presence: true,uniqueness: { case_sensitive: false }
   validate :on => :create do
    if group && group.groupitems.length > 12
      errors.add(:group, "too many things")
    end
  end

end
