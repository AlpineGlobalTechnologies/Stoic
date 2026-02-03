class PagesController < ApplicationController
    def home
      @quote = Quote.order(created_at: :desc)
      # or .order(:title) or whatever sorting you prefer
    end
  end