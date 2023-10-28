class Pet < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo

  validates :size, presence: true
  validates :details, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
