class Groupitem < ApplicationRecord
  belongs_to :group
  belongs_to :item
  validates  :item_id, presence: true,uniqueness: { case_sensitive: false }
end
