class Admin::BaseController < ApplicationController
    layout "admin"   # ← this line makes all child controllers use admin.html.erb

    before_action :authenticate_admin!

    helper_method :admin_signed_in?  # optional

    private

    def authenticate_admin!
        authenticate_user!
        unless current_user&.admin?
        redirect_to root_path, alert: "Admins only."
        end
    end
end