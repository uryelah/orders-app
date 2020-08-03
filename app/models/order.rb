class Order < ApplicationRecord
  validates :state, presence: true, numericality: { only_integer: true }
  validates :control_number, allow_blank: true, numericality: { only_integer: true }, uniqueness: true
  validate :ensure_unique_control_number

  before_validation :set_initial_state
  after_create :set_control_number

  protected

  def set_initial_state
    self.state = 0
  end

  def set_control_number
    self.control_number = id if control_number.nil? || control_number.zero?
  end

  def ensure_unique_control_number
    return unless Order.where(control_number: control_number).length.positive?

    errors.add(:control_number, 'Control_number should be unique')
  end
end
