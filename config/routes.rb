Rails.application.routes.draw do
  namespace :admin do
    root to: "homes#top"
    resources :order_details, only: [:update]
    resources :orders, only: [:index,:show,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update,:destroy]
    resources :items, only: [:index,:new,:create,:show,:edit,:update,:destroy]
  end
  
  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about'
  
    resources :shopping_addresses, only: [:index,:edit,:create,:update,:destroy]
    resources :orders, only: [:new,:create,:index,:show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/done' => 'orders#done'
    
    resources :cart_items, only: [:index,:update,:destroy,:create]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
  
    resources :items, only: [:index,:show]
    resources :genres, only: [:show]
  end
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
     sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
