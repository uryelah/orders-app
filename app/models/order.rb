class Order < ApplicationRecord
  validates :state, presence: true, numericality: { only_integer: true }
  validates :control_number, presence: true, numericality: { only_integer: true }
end
