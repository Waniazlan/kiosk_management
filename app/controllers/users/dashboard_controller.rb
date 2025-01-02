class Users::DashboardController < ApplicationController
  layout "kioskapp"
  # before_action :set_dashboard, only: [:show]
  before_action :authenticate_user!

    def index
      @kiosks = Kiosk.all
    end


    def check_out
      user_id = current_user&.id
      Attendant::CheckoutJob.perform_now(user_id)
      Rails.logger.info " the user has been checkout #{user_id}"
      redirect_to users_dashboard_path, notice: "Check-out is being processed."
    end

    private


    def authenticate_user
      unless session[:user_id].present?
        redirect_to new_user_session_path, alert: "You must be logged in to access this page"
      end
    end
end
