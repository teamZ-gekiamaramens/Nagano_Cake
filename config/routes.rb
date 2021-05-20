Rails.application.routes.draw do
  namespace :public do
  resources :deliveries, only: [:create, :index, :edit, :update, :destroy]
  get 'about' => 'homes#about'
 end
 root to: 'public/homes#top'
end
