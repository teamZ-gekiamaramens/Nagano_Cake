class Public::DeliveriesController < ApplicationController

  def create
    @deliverie = Delivery.new(deliverie_params)
    @deliverie.customer_id = current_customer.id
    if @deliverie.save
     redirect_to public_deliveries_path
    else
      @deliveries = Delivery.all
      flash[:notice] = '配送先情報を入力してください'
      render :index
    end
  end

  def index
     @deliverie = Delivery.new
     @deliveries = current_customer.deliveries
  end


  def edit
    @deliverie = Delivery.find(params[:id])
  end


  def update
    @deliverie = Delivery.find(params[:id])
    @deliverie.update(deliverie_params)
    redirect_to public_deliveries_path
  end


  def destroy
    @deliverie = Delivery.find(params[:id])
    @deliverie.destroy
    redirect_to public_deliveries_path
  end

  private

  def deliverie_params
    params.require(:delivery).permit(:name, :address, :postal_code)
  end

end
