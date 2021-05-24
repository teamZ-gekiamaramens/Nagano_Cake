class Admin::OrdersController < ApplicationController
  def index
    #@order = Order.find(order_params)
  end

  def show
    @cart_item = CartItem.find(cart_item_params)
    @cart_items = CartItem.where(customer_id: customer.id)
    @total_price = @cart_items.sum{|cart_item|cart_item.item.price * cart_item.amount * 1.1 }
  end
  
  private
  
  def order_params
    params.permit(:name, :address, :postal_code, :payment, :customer_id, :shipping, :total)
  end
  
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id, :create_status)
  end
  
end
