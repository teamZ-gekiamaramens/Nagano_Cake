class Public::OrdersController < ApplicationController

    def new
     @order = Order.new
     @customer = current_customer
     @delivery_address = @customer.deliveries
     @delivery = Delivery.new
    end

    def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    end

    private

    def order_params
     params.require(:order).permit(:name, :address, :postal_code,:payment,:total,:shipping)
    end
end
