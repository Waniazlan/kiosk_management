class ApplicationController < ActionController::Base
  layout "authentication" # Specify a layout for authentication views

  # Allow only modern browsers (optional, and ensure the correct syntax)
  allow_browser versions: :modern

  # Define a custom path after sign-in
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_dashboard_path  # Redirect to admin dashboard after admin login
    else
      users_dashboard_path  # Redirect to user dashboard for non-admin users
    end
  end
end
