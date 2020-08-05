# frozen_string_literal: true

class AddIndexToStateAndControlNumber < ActiveRecord::Migration[6.0]
  def change
    add_index :orders, :state
    add_index :orders, :control_number
  end
end
