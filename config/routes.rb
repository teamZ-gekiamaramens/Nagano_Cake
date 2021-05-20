Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admin/sessions'
}

  namespace :admin do
    resources :customers, only: [:index,:show,:edit,:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
