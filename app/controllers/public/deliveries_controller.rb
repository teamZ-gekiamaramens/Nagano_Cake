class Public::DeliveriesController < ApplicationController

  def create
    @deliverie = Deliverie.new
    @deliverie = Deliverie.new(deliverie_params)
    @deliverie.save
    redirect_to public_deliveries_path
  end

  def index
     @deliverie = Deliverie.new
     @deliveries = Deliverie.all
  end

  private

  def deliverie_params
    params.require(:deliverie).permit(:name, :address, :postal_code)
  end

end
