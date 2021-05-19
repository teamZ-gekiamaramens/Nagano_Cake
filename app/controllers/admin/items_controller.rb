class Admin::ItemsController < ApplicationController
    def new
        #新規アイテムの追加
        @item = Item.new
        
    end
    def create
        @item = Item.new
        if @item.save #登録出来たら
            redirect_to admin_item_path(@item.id), notice: "新商品を追加しました。"
        else #登録できなかったら
            render 'index'#仮
        end
    end
    def index
        #ページング機能の追加=========================
        @items = Item.page(params[:page]).reverse_order
        #=============================================
    end
    
    def show
        #アイテムのidを参照して指定された商品詳細を表示
        @item = Item.find(params[:id])
        
    end
    
    def edit
    end
    
end
