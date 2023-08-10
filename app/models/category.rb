class Category < ApplicationRecord
  belongs_to :user
  
  
  mount_uploader :icon, IconUploader
  validates :name, presence: true
end