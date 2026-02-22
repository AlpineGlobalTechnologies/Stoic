class Quote < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true
    # validates :date, uniqueness: true   # optional
  
    scope :for_today, -> { find_by(date: Date.current) }
    scope :random,    -> { order('RANDOM()').first }   # PostgreSQL
    # scope :random, -> { order('RAND()').first }      # MySQL / SQLite
  end