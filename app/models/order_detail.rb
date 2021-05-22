class OrderDetail < ApplicationRecord
<<<<<<< HEAD
belongs_to :order
belongs_to :item
=======
    def new
        @order = Order.new
        @address = Address.where(customer: current_customer)
        @customer = current_customer
    end
>>>>>>> dc6a338b34a1e87384ad0b32458b296017bc877f
end
