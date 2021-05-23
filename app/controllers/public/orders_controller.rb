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
     @order = Order.new(order_params)
     @cart_items = current_customer.cart_items                     # カートアイテム呼び出し
     @total_price = @cart_items.sum{|cart_item|cart_item.item.price * cart_item.amount * 1.1 }
    end
    
    def thanks
    end

    private

    def order_params
     params.permit(:name, :address, :postal_code, :payment, :total, :shipping)
    end
    
end
