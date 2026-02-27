class PagesController < ApplicationController
  def home
    @quote = Quote.for_today || Quote.order(created_at: :desc).first
    @author = Author.all
  end
end