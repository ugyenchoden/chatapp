# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :roles, :name, unique: true
  end
end
