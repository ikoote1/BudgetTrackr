class Transaction < ApplicationRecord
  belongs_to :user
  has_many :categorized_categories, class_name: "CategorizedCategory", foreign_key: "categorized_transaction_id"
  has_many :categories, through: :categorized_categories

  validates :name, presence: true
  validates :amount, presence: true
end