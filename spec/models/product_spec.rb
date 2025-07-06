require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with a name and price" do
    expect(Product.new(name: "Mouse", price: 20, stock: 10)).to be_valid
  end

  it "is invalid without a name" do
    expect(Product.new(price: 20)).not_to be_valid
  end

  it "is invalid without a price" do
    expect(Product.new(name: "Mouse")).not_to be_valid
  end
  it "is invalid without a stock value" do
    expect(Product.new(name: "Mouse", price: 20)).not_to be_valid
  end

  it "is valid with stock of 0" do
    product = Product.new(name: "Mouse", price: 20, stock: 0)
    expect(product).to be_valid
  end

end