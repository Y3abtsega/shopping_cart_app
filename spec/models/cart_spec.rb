require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.create }
  let(:product) { Product.create(name: "Keyboard", price: 100) }

  describe "#add_product" do
    it "adds a product to the cart" do
      cart.add_product(product.id)
      expect(cart.cart_items.count).to eq(1)
      expect(cart.cart_items.first.quantity).to eq(1)
    end
  end
end
