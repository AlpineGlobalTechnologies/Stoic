class Quote < ApplicationRecord
    validates :title, presence: true
end
