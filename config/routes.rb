Rails.application.routes.draw do
  devise_for :customers
   namespace :public do
   resources :customers, only: [:show,:update,:index] do
       collection do
        get :edit
        get 'unsubscribe'
        patch "withdrawal"
       end
   end
 end
end