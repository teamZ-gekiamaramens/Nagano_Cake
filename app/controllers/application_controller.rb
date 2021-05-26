class ApplicationController < ActionController::Base

# before_action :authenticate_customer!,except: [:top]
before_action :configure_permitted_parameters, if: :devise_controller?
def after_sign_in_path_for(resource)
  if current_customer
     public_items_path(resource) # ログイン後に遷移するpathを設定
  else
    admin_orders_path
  end
end




 def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
 end




   protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:last_name, :first_name, :last_name_kana, :first_name_kana, :address_number, :address, :phone_number, :email])
    end
end
