require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with a name and price" do
    expect(Product.new(name: "Mouse", price: 20)).to be_valid
  end

  it "is invalid without a name" do
    expect(Product.new(price: 20)).not_to be_valid
  end

  it "is invalid without a price" do
    expect(Product.new(name: "Mouse")).not_to be_valid
  end
end