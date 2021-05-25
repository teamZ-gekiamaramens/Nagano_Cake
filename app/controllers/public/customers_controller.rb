class Public::CustomersController < ApplicationController
 def show
    @customer = current_customer
 end

 def edit
     @customer = current_customer
 end

 def update
   @cutomer=Customer.find(params[:id])

    if @cutomer.update(customer_params)
     redirect_to public_customer_path(@cutomer)
    else
     render :edit
    end
 end


def unsubscribe

end


def withdrawal
    @customer = current_customer
    #現在ログインしているユーザーを@userに格納
     @customer.update(withdrawal: true)
    #updateで登録情報をInvalidに変更
    reset_session
    #sessionIDのresetを行う
     redirect_to root_path
    #指定されたrootへのpath
end

private
 def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address_number, :address, :phone_number, :email,:withdrawal)
 end
end
