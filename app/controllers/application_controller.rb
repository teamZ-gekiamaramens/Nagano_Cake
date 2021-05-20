class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    admin_customers_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path # ログアウト後に遷移するpathを設定
  end
end
