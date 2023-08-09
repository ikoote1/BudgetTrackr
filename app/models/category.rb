class Category < ApplicationRecord
  belongs_to :user
  has_many :categorized_categories
  has_many :categorized_transactions, through: :categorized_categories, class_name: "Transaction"

  mount_uploader :icon, IconUploader
  validates :name, presence: true
end
