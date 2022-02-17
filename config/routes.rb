Rails.application.routes.draw do
  root 'public/homes#top'
  get 'about', to: 'public/homes#about'

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

  #会員側
  scope module: 'public' do
    resources :customers, only: [:show, :edit, :update] do
      collection do
        resources :addresses, only: [:index, :create, :destroy, :edit, :update]
        get 'products', to: 'products#index', as: 'products'
        get 'products/:id', to: 'products#show', as: 'product'
      end
    end
    get '/customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw_customer' #退会画面への遷移
    patch '/customers/:id/withdraw' => 'customers#switch', as: 'withdraw_switch_customer' #会員ステータスの切替
  end

  #管理者側
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    get 'top', to: 'homes#top'
    resources :products, only: [:new, :index, :show, :create, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
end




