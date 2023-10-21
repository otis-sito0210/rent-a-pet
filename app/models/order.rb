class Order < ApplicationRecord
  belongs_to :pet_id
  belongs_to :user_id

  validates :date, presence: true
end
