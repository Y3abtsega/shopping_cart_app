require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:user) { User.create!(name: "Test User", email: "test@example.com") }
  let(:cart) { Cart.create!(user: user) }
  let(:product) { create(:product) }

  describe "#add_product" do
    it "adds a product to the cart" do
      cart.add_product(product.id)
      expect(cart.cart_items.count).to eq(1)
      expect(cart.cart_items.first.quantity).to eq(1)
    end

    it "increases the quantity of a product in the cart" do
      cart.add_product(product.id)
      cart.add_product(product.id)
      expect(cart.cart_items.count).to eq(1)
      expect(cart.cart_items.first.quantity).to eq(2)
    end

    it "increments quantity if product already in cart" do
      2.times { cart.add_product(product.id) }
      expect(cart.cart_items.first.quantity).to eq(2)
    end

    it "does not add a product that does not exist" do
      cart.add_product(123)
      expect(cart.cart_items.count).to eq(0)
    end

    it "does not add a product that is out of stock" do
      out_of_stock_product = Product.create(name: "Mouse", price: 50, in_stock: false)
      cart.add_product(out_of_stock_product.id)
      expect(cart.cart_items.count).to eq(0)
    end

  end

  describe "#remove_product" do
    it "decrements quantity or removes item" do
      2.times { cart.add_product(product.id) }
      cart.remove_product(product.id)
      expect(cart.cart_items.first.quantity).to eq(1)
      cart.remove_product(product.id)
      expect(cart.cart_items.count).to eq(0)
    end
  end

  describe "#total_price" do
    it "calculates total correctly" do
      cart.add_product(product.id)
      expect(cart.total_price).to eq(100)
      cart.add_product(product.id)
      expect(cart.total_price).to eq(200)
    end
  end
end
