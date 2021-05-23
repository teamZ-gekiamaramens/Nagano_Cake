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
    redirect_to public_log_path(@order.id)
    end
    
    def log
     @cart_item = CartItem.where(customer_id: current_customer.id)
     #where(AA:BB)はAAで指定したカラムでBBで一致した情報を@cart_itemに格納する
     @shipping = 800
     @all_total = @shipping + @total_price
     
    end
    
    def thanks
    end

    def log
     @order = Order.new
     if params[:order][:address] == 0
       @order.address_number = current_customer.address_number
       @order.address = current_customer.address
       @order.last_name = current_customer.last_name
     elsif params[:order][:address] == 1
       delivery = Deliver_Address.find(params[:order][:deliver_id])
       @order.address_number = delivery.address_number
       @order.address = delivery.address
       @order.destination = delivery.destination
     end
    end


    private

    def order_params
     params.require(:order).permit(:name, :address, :postal_code,:payment,:total,:shipping)
    end
end
