class Admin::DashboardController < Admin::BaseController
  before_action :authenticate_admin!

  def index
    @quote_count = Quote.count
  end
end