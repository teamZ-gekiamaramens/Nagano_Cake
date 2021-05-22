class Public::ItemsController < ApplicationController
    def index
        @items = Item.all
        @quantity = Item.count
    end
    
    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem
    end
    
    private
    def item_params
        params.require(:item).permit(:genre_id, :name, :price, :status, :introduction, :image_id)
    end
    
    
end
