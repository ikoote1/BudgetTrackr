require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(email: 'Ikoote@gmail.com', password: 'password', name: 'Ikoote')
    item = Item.new(name: 'Item Name', amount: 10, user_id: user.id)
    expect(item).to be_valid
  end

  it 'is not valid without a name' do
    item = Item.new(name: nil, amount: 10)
    expect(item).not_to be_valid
  end

  it 'is not valid with a negative amount' do
    item = Item.new(name: 'Item Name', amount: -10)
    expect(item).not_to be_valid
  end
end
