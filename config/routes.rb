Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 会員側のルーティング設定
    get 'items' => 'public/items#index'
    get '/items/:id' => 'public/items#show'
    # 管理者側のルーティング設定
    namespace :admin do
      resources :items, only: [:index, :show, :new, :create, :edit, :update]
      resources :genre, only: [:index, :edit, :create, :update]
    end
end
