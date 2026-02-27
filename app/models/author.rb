class Author < ApplicationRecord
  has_many :quotes, dependent: :restrict_with_error
  has_one_attached :avatar
end