class Public::DeliveriesController < ApplicationController

  def create
    @deliverie = Deliverie.new(deliverie_params)
    if @deliverie.save
     redirect_to public_deliveries_path
    else
      @deliveries = Deliverie.all
      flash[:notice] = '配送先情報を入力してください'
      render :index
    end
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
