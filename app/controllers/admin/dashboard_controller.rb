class Admin::DashboardController < ApplicationController
      # Ensure only admins can access the admin area
      before_action :authenticate_admin!
  
      def index
        # Dashboard logic for admins
      end
end

  