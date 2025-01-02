class Users::KiosksController < ApplicationController
  layout "userapp"
  before_action :set_kiosk, only: [ :show ]

  # Show details of the currently selected kiosk
  def show
    user = current_user
    @kiosk = Kiosk.find_by(id: params[:id])
    Attendant::CreateAttendantsJob.perform_now(@kiosk.id, user)
    if @kiosk.nil?
      redirect_to users_dashboard_path, alert: "Please select a kiosk to proceed."
    end
  end
  private

  # Fetch the current kiosk based on session or user data
  def set_kiosk
    @kiost = Kiosk.find_by(id: params[:kiosk_id])
  end
end
