class Cart < ApplicationRecord
  belongs_to :user, optional: true  
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  #return unless product && product.in_stock?


  def add_product(product_id)
        product = Product.find_by(id: product_id)
        return unless product && product.in_stock?

        item = cart_items.find_or_initialize_by(product_id: product_id)
        item.quantity = (item.quantity || 0) + 1
        item.save!
  end

   def remove_product(product_id)
    item = cart_items.find_by(product_id: product_id)
    return unless item

    if item.quantity > 1
      item.quantity -= 1
      item.save!
    else
      item.destroy
    end
  end
  
  def total_price
    cart_items.includes(:product).sum { |item| item.product.price * item.quantity }
  end
end
