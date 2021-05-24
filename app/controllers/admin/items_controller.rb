class Admin::ItemsController < ApplicationController
    def new
        #新規アイテムの追加
        @item = Item.new

    end
    def create
        #@itemの定義
        @item = Item.new(item_params)

        if @item.save #登録出来たら============================================
            redirect_to admin_item_path(@item.id), success: "新商品を追加しました。"
        else #登録できなかったら===============================================
            @items = Item.page(params[:page]).reverse_order
            render 'index', danger: "登録失敗しました"
        end
    end
    def index
        #ページング機能の追加=========================
        @items = Item.page(params[:page])
        #=============================================

    end

    def show
        #アイテムのidを参照して指定された商品詳細を表示
        @item = Item.find(params[:id])

    end

    def edit
        #アイテムのidを参照して指定された商品詳細を表示
        @item = Item.find(params[:id])
    end
    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to admin_item_path(@item.id)
        else
            render 'edit'
        end
    end

    private
    def item_params
        params.require(:item).permit(:genre_id, :name, :price, :is_active, :introduction, :image)
    end

end
