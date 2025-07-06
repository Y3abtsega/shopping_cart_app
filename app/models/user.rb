class User < ApplicationRecord
    has_one :cart, dependent: :destroy
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    after_create :create_cart

    private

    def create_cart
        Cart.create(user: self)
    end  

end