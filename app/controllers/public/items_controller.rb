class Public::ItemsController < ApplicationController
    def index
        @items = Item.all
        @quantity = Item.count
        
        #ページング機能の追加=========================
        @items = Item.page(params[:page]).per(8)
        #=============================================
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
