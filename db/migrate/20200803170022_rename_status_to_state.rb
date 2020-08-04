# frozen_string_literal: true

class RenameStatusToState < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :status, :state
  end
end
