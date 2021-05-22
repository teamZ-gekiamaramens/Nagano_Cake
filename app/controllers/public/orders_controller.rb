class Public::OrdersController < ApplicationController

    def new
      @customer = current_customer
      @order = Order.new
      @addresses = Deliverie.where(customer: current_customer)

    end
end
