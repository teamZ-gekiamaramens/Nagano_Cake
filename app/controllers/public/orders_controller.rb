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


    def thanks
    end

    def log
      @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
        @order.address = current_customer.address
        @order.postal_code = current_customer.address_number
        @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
        @address = Delivery.find(params[:order][:delivery_id])
        @order.address = @address.address
        @order.name = @address.name
        @order.postal_code = @address.postal_code


    end

    end


    private

    def order_params
     params.require(:order).permit(:name, :address, :postal_code, :payment, :customer_id, :shipping, :total)
    end
end
