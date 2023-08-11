require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with valid attributes" do
    user1 = User.create(email: "ikoote@gmail.com", password: "password", name: "Ikoote")
    category = Category.new(name: "Category Name", icon: "http:fhdhs", user_id: user1.id)
    expect(category).to be_valid
  end

  it "is not valid without a name" do
    category = Category.new(name: nil)
    expect(category).not_to be_valid
  end
end
