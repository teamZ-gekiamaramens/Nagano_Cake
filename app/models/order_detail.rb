class OrderDetail < ApplicationRecord
    # def new
        # @order = Order.new
        # @address = Address.where(customer: current_customer)
        # @customer = current_customer
    # end
 belongs_to :order
 belongs_to :item
 enum create_status: {cannot_be_started: 0, waiting_for_production: 1, in_production: 2, production_completed: 3}
end
