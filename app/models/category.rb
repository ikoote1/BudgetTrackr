class Category < ApplicationRecord
  belongs_to :user
  has_many :categorizations
  has_many :items, through: :categorizations
  
  mount_uploader :icon, IconUploader
  validates :name, presence: true
end