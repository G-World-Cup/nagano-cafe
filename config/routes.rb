Rails.application.routes.draw do
  root 'public/products#top'
  get 'about', to: 'public/products#about'
  get 'customers/products', to: 'public/products#index'
  get 'customers/products', to: 'public/products#show'

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end