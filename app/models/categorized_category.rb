class CategorizedCategory < ApplicationRecord
  belongs_to :transaction, class_name: "Transaction", foreign_key: "transaction_id"
  belongs_to :category, class_name: "Category", foreign_key: "category_id"
end
