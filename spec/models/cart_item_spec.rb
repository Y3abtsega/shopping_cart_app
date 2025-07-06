require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:product) }

  it "is invalid with non-positive quantity" do
    cart_item = CartItem.new(quantity: 0)
    expect(cart_item).not_to be_valid
  end
end
