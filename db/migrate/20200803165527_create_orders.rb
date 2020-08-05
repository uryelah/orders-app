# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :control_number
      t.integer :status

      t.timestamps
    end
  end
end
