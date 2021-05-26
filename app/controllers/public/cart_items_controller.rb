class Public::CartItemsController < ApplicationController
  def index

    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = @cart_items.sum{|cart_item|cart_item.item.price * cart_item.amount * 1.1 }
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    #カートアイテムの初期化
    @cart_items = current_customer.cart_items
    #@cart_itemsにcart_itemの情報が格納される
    if @cart_item.amount != nil && @cart_items.pluck(:item_id).include?(@cart_item.item_id)
      cart_item = @cart_items.find_by(item_id: @cart_item.item_id)
      new_amount = cart_item.amount + @cart_item.amount
      cart_item.update(amount: new_amount)
    else
      @cart_item.customer_id = current_customer.id
      #カートアイテムの会員IDを、現在の会員として格納する
      if @cart_item.save
        flash[:notice] = "カートに追加しました"
      else
        flash[:alert] = "個数が入力されていません"
        redirect_to request.referer and return
      end
    end
    redirect_to public_cart_items_path
  end

  # 1.submitしてshowページのデータを送信
  # 2.空のインスタンスを用意 cartitem.new
  # 3.受け取った情報を空のインスタンスに代入する

   # A(同じ商品がなかった場合...)
  # 4-A.カートアイテムの外部キーを設定する
  # 5-A.saveする。

   # B(同じ商品があった場合...)
  # 4-B.元々の有った商品の個数を加算する
  # 5-B.update

  # 6.リダイレクト。

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:alert] = "#{@cart_item.item.name}を削除しました。"
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.delete_all
    flash[:alert] = "カート内の商品を全て削除しました。"
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
