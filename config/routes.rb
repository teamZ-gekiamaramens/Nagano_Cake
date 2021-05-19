Rails.application.routes.draw do
  namespace :public do
  resources :deliveries, only: [:create, :index, :edit, :update, :destroy]
  resource :homes, only: [:top, :about]
 end
end
