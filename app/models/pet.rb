class Pet < ApplicationRecord
  belongs_to :user

  validates :size, presence: true
  validates :details, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
