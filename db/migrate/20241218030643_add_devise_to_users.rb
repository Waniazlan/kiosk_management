# frozen_string_literal: true
class AddDeviseToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.string :encrypted_password, default: "", null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.index :reset_password_token, unique: true
    end
  end
end
