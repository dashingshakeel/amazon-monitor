class Item < ApplicationRecord
  belongs_to :user
  REG_EX = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/
  validates :name, presence: true
  validates :url, presence: true,   format: { with: REG_EX,  :multiline => true }
  has_one :group
end
