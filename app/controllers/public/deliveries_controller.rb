class Public::DeliveriesController < ApplicationController

  def create
    @deliverie = Deliverie.new(deliverie_params)
    @deliverie.save
    redirect_to public_deliveries_path
  end

  def index
     @deliverie = Deliverie.new
     @deliveries = Deliverie.all
  end


  def edit
    @deliverie = Deliverie.find(params[:id])
  end


  def update
    @deliverie = Deliverie.find(params[:id])
    @deliverie.update(deliverie_params)
    redirect_to public_deliveries_path
  end


  def destroy
    @deliverie = Deliverie.find(params[:id])
    @deliverie.destroy
    redirect_to public_deliveries_path
  end

  private

  def deliverie_params
    params.require(:deliverie).permit(:name, :address, :postal_code)
  end

end
