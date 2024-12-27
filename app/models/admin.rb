class Admin < ApplicationRecord
    # Ensure this line is present for Devise to work with this model
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  end