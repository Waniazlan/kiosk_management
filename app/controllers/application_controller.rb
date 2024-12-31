class ApplicationController < ActionController::Base
   layout "authentication"
  allow_browser versions: :modern
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_dashboard_path
    else
      users_dashboard_path
    end
  end
 
end
