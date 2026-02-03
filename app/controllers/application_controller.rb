class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  
  allow_browser versions: :modern
  # http_basic_authenticate_with name: "admin", password: "your_secret_password", except: [:home]  # Protect all except homepage

  private

  def authenticate_admin!
    authenticate_user!  # Ensures user is logged in
    unless current_user&.admin?
      redirect_to root_path, alert: "Admins only."
    end
  end
  
end
