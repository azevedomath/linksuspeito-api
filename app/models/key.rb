class Key < ApplicationRecord
  belongs_to :user
  validates :hash_key, presence: true
end
