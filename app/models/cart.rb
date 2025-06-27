class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def add_product(product_id)
    item = cart_items.find_or_initialize_by(product_id: product_id)
    item.quantity ||= 0
    item.quantity += 1
    item.save
  end

  def remove_product(product_id)
    item = cart_items.find_by(product_id: product_id)
    return unless item

    if item.quantity > 1
      item.quantity -= 1
      item.save
    else
      item.destroy
    end
  end

end
