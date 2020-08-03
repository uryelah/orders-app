class Order < ApplicationRecord
  validates :state, presence: true, numericality: { only_integer: true }
  validates :control_number, allow_blank: true, numericality: { only_integer: true }, uniqueness: true
  validate :ensure_unique_control_number

  before_validation :set_initial_state
  after_create :set_control_number

  scope :pending, -> { where(state: 0) }
  scope :progress, -> { where(state: 1) }
  scope :complete, -> { where(state: 2) }
  scope :control, ->(number) { where(control_number: number) }

  protected

  def set_initial_state
    self.state = 0
  end

  def set_control_number
    update_attributes!(control_number: id) if control_number.nil? || control_number.zero?
  end

  def ensure_unique_control_number
    found_match = Order.where(control_number: control_number)

    return unless found_match.length.positive? && found_match[0].id != id

    errors.add(:control_number, 'Control_number should be unique')
  end

  public

  def increment_state
    return if state == 2

    incremented_state = state + 1

    update_columns(state: incremented_state)
  end
end
