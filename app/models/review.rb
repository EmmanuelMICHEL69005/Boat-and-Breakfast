class Review < ApplicationRecord
  belongs_to :boat
  validates :content, presence: true
end
