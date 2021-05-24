class Public::HomesController < ApplicationController

  def top
    #ページング機能の追加=========================
    @items = Item.page(params[:page]).per(4).reverse_order
    #=============================================
  end

  def about
  end
end
