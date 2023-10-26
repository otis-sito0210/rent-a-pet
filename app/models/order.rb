class Order < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  # validates :date, presence: true
end
