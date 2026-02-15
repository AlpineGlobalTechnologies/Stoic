class PagesController < ApplicationController
  def home
    @quote = Quote.for_today || Quote.order(created_at: :desc).first
  
  end
end