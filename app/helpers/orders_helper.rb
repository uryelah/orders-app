# frozen_string_literal: true

# Orders helper methods
module OrdersHelper
  def number_to_state(index)
    %w[Pending Progress Complete][index]
  end

  def number_to_class(index)
    %w[warning info success][index]
  end

  def btn_disabled(state)
    state == 2 ? 'disabled' : ''
  end
end
