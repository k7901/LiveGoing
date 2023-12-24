Rails.application.routes.draw do

  devise_for :customers,controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :customer do
    post 'customer/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
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
    get '/customers/information/edit' => 'customers#edit',as: 'customers_edit'
    patch '/customers/information' => 'customers#update',as: 'customers_update'
    get '/customers/my_page' => 'customers#show',as:'customers_show'
    get '/customers/check' => 'customers#check'
    patch 'customers/withdraw' => 'customers#withdraw'
    post 'customers/sign_out' => 'sessions#destroy'
    resources :hotels, only: [:index, :show] do
      resources :comments
    end
    resources :rooms, only: [:show]
    get '/prefectures_for_region', to: 'prefectures#prefectures_for_region'
    get '/venues_for_prefecture', to: 'venues#venues_for_prefecture'
  end
end
