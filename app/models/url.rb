class Url < ApplicationRecord
  belongs_to :user

  validates :destination, presence: true
  validates :key, presence: true, uniqueness: true
  validates :full_url, presence: true, uniqueness: true
  
end
