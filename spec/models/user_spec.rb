require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name and email" do
    user = User.new(name: "Alice", email: "alice@example.com")
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(email: "alice@example.com")
    expect(user).not_to be_valid
  end

  it "is invalid without an email" do
    user = User.new(name: "Alice")
    expect(user).not_to be_valid
  end

  it "has a unique email" do
    User.create(name: "Bob", email: "bob@example.com")
    duplicate_user = User.new(name: "Other Bob", email: "bob@example.com")
    expect(duplicate_user).not_to be_valid
  end

  it "can be associated with a cart" do
    user = User.create(name: "Charlie", email: "charlie@example.com")
    cart = Cart.create(user: user)
    expect(user.cart).to eq(cart)
  end
  
  it "automatically creates a cart after user is created" do
    user = User.create(name: "Dana", email: "dana@example.com")
    expect(user.cart).not_to be_nil
  end
end