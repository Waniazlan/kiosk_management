
class Attendant::CheckoutJob < ApplicationJob

  def perform(user_id)
   
    user = User.find_by(id: user_id)
    if user.nil?
      Rails.logger.error "User not found with ID: #{user_id}"
      return
    end

        active_shift = AttendantShift.find_by(user_id: user.id, checked_out_at: nil)

        if active_shift
        active_shift.update!(checked_out_at: Time.current)
        Rails.logger.info "Check-out successful for user #{user.id}."
        else
        Rails.logger.info "No active shift found for user #{user.id}."
        end
    end
  end
  