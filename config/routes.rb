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

 devise_for :admins, controllers: {
  sessions: 'admin/sessions'
}

  namespace :admin do
    resources :customers, only: [:index,:show,:edit,:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 namespace :public do
  resources :deliveries, only: [:create, :index, :edit, :update, :destroy]
  get 'about' => 'homes#about'
   resources :items, only: [:index, :show]
 end
 root to: 'public/homes#top'
   # 会員側のルーティング設定

  # 管理者側のルーティング設定
  namespace :admin do
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
    resources :genre, only: [:index, :edit, :create, :update]
  end

 namespace :public do
     resources :orders, only: [:index, :show, :new, :create]
     get 'log' => 'public/orders#log'
     get 'thanks' => 'public/orders#thanks'
    end

   namespace :admin do
     resources :orders, only: [:show, :update]
   end
end

