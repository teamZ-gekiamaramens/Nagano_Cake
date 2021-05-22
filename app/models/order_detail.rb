class OrderDetail < ApplicationRecord
    def new
        @order = Order.new
        @address = Address.where(customer: current_customer)
        @customer = current_customer
    end
end
