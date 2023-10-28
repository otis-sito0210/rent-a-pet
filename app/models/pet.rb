class Pet < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :size, presence: true
  validates :details, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
