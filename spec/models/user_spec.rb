require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email: 'ikoote@gmail.com', password: 'password', name: 'Ikoote')
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(email: nil, password: 'password', name: 'Ikoote')
    expect(user).not_to be_valid
  end
end
