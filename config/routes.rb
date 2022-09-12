Rails.application.routes.draw do

  root 'public/homes#top'


  #ユーザー用
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 scope module: :public do
  #ここにpublicのルート

   post '/homes/guest_sign_in', to: 'homes#new_guest'
   get 'users/unsubscribe'=> 'users#unsubscribe',as: "unsubscribe"
   get 'search' => 'searches#index'

  resources :users do
   resource :relationships, only:[:create,:destroy]
   get :followings, on: :member
   get :followers,  on: :member
  end
  resources :works do
   resource :favorites,     only: [:create,:destroy]
   resources :comments,      only: [:index,:create,:destroy] do
    resources :reports,       only: [:new,:create]
   end
  end
  
  resources :favorites,      only: [:index]
  resources :ranks,         only: [:index]
  resources :follows,       only: [:index,:create,:destroy]

 end


  devise_for :admins, controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
   #ここにadminのルート
   get 'admin' => 'homes#top'
   get 'search' => 'searches#index'

   resources :reports,      only: [:index,:destroy]
   resources :works
   resources :users

 end

end
