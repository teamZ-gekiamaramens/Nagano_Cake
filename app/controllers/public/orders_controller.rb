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
    
    def log
     @cart_item = CartItem.where(customer_id: current_customer.id)
     #where(AA:BB)はAAで指定したカラムでBBで一致した情報を@cart_itemに格納する
     @shipping = 800
     @all_total = @shipping + @total_price
     
    end
    
    def thanks
    end

    private

    def order_params
     params.require(:order).permit(:name, :address, :postal_code,:payment,:total,:shipping)
    end
end
