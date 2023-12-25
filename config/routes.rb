Rails.application.routes.draw do

  devise_for :users,controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post 'user/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :hotels do
      resources :rooms, except: [:index]
    end
    resources :venues, except: [:show]
    resources :services, except: [:show]
    resources :reviews, except:[:new, :create, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get '/users/information/edit' => 'users#edit',as: 'users_edit'
    patch '/users/information' => 'users#update',as: 'users_update'
    get '/users/my_page' => 'users#show',as:'users_show'
    get '/users/check' => 'users#check'
    patch 'users/withdraw' => 'users#withdraw'
    post 'users/sign_out' => 'sessions#destroy'
    resources :hotels, only: [:index, :show] do
      resources :comments
    end
    resources :rooms, only: [:show]
    get '/prefectures_for_region', to: 'prefectures#prefectures_for_region'
    get '/venues_for_prefecture', to: 'venues#venues_for_prefecture'
  end
end
