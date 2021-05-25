class Admin::OrdersController < ApplicationController
 before_action :authenticate_admin!
  def index
    @orders = Order.page(params[:page]).reverse_order.per(10)
    #@total_quantity = @order_quantity.sum{order_item.amount}
    @count =0
  end


  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all

  end

  def update
    @order = Order.find(params[:id])
    if  @order = Order.find(params[:id])
        @order.update(order_params)
        redirect_to admin_orders_path
    else
      render :show
    end
  end


  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment, :customer_id, :shipping, :total, :order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:quantity, :make_status, :price)
  end

end

# @order.update(order_params) && @order.confirm_deposit?
        # @order.order_details.update_all(order_status: 0)
      # redirect_to admin_order_path(@order)