class Transaction < ApplicationRecord
  belongs_to :user
  has_many :categorized_categories
  has_many :categories, through: :categorized_categories

  validates :name, presence: true
  validates :amount, presence: true
end
