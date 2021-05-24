class Public::OrdersController < ApplicationController
  
  def new
     @order = Order.new
     @customer = current_customer
     @delivery_address = @customer.deliveries
     @delivery = Delivery.new

    end


  def create
    order = current_customer.orders.new(order_params)
    order.save
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.quantity = cart_item.amount
      order_detail.price = cart_item.item.price*1.1*cart_item.amount
      order_detail.order_id = order.id
      order_detail.item_id = cart_item.item.id
      order_detail.save
    end
    cart_items.destroy_all
    redirect_to public_thanks_path
  end

  def thanks
  end

  def log
     @order = Order.new(order_params)
     @cart_item = CartItem.where(customer_id: current_customer.id)
     #where(AA:BB)はAAで指定したカラムでBBで一致した情報を@cart_itemに格納する
     @cart_items = current_customer.cart_items                     # カートアイテム呼び出し
     @total_price = @cart_items.sum{|cart_item|cart_item.item.price * cart_item.amount * 1.1 }


    if params[:order][:address_option] == "0"
        @order.address = current_customer.address
        @order.postal_code = current_customer.address_number
        @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
        @address = Delivery.find(params[:order][:delivery_id])
        @order.address = @address.address
        @order.name = @address.name
        @order.postal_code = @address.postal_code

    elsif params[:order][:address_option] == "2"
       @delivery = Delivery.new(deliverie_params)
       @delivery.customer_id = current_customer.id
       @delivery.save
       @order.address = @delivery.address
       @order.name = @delivery.name
       @order.postal_code = @delivery.postal_code
    end



    def index
      @orders = current_customer.orders
    end

    def show
      @order = Order.find(params[:id])
    end


  private
    def order_params
     params.require(:order).permit(:name, :address, :postal_code, :payment, :customer_id, :shipping, :total)
    end

    def deliverie_params
     params.require(:delivery).permit(:name, :address, :postal_code)
    end
end