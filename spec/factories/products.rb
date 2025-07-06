# spec/factories/products.rb
FactoryBot.define do
  factory :product do
    name { "Keyboard" }
    price { 100 }
    stock { 10 }
  end
end