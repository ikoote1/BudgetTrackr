class Item < ApplicationRecord
  belongs_to :user

  has_many :categorizations
  has_many :categories, through: :categorizations
end
