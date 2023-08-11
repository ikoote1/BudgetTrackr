class Item < ApplicationRecord
  belongs_to :user

  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
