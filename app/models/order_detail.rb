class OrderDetail < ApplicationRecord
    # def new
        # @order = Order.new
        # @address = Address.where(customer: current_customer)
        # @customer = current_customer
    # end

 belongs_to :order
end
