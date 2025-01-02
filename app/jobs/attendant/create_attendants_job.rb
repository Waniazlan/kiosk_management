
class Attendant::CreateAttendantsJob < ApplicationJob

    def perform(kiosk_id, user_id)
    
      user = User.find_by(id: user_id)
      kiosk = Kiosk.find_by(id: kiosk_id)
  
      if user.nil? || kiosk.nil?
        Rails.logger.error "Invalid kiosk or user for check-in (Kiosk: #{kiosk_id}, User: #{user_id})"
        return
      end
  
      active_shift = AttendantShift.find_by(user_id: user.id, checked_in_at: nil)

        if active_shift
        Rails.logger.info "User #{user.id} is already checked in at kiosk #{active_shift.kiosk_id}."
        else
        # Create a new shift for the user
        AttendantShift.create!(
            kiosk_id: kiosk.id,
            user_id: user.id,
            checked_in_at: Time.current
        )
        Rails.logger.info "Check-in successful for user #{user.id} at kiosk #{kiosk.id}."
        end
    end
  end
  