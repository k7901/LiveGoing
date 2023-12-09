Rails.application.routes.draw do

  devise_for :customers,controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :hotels
    resources :rooms
    resources :venues, except: [:show]
    resources :services, except: [:show]
    resources :bookings, only: [:show, :update]
    resources :booking_details, only: [:update]
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
    resources :rooms, only: [:show]
    resources :bookings, only: [:new, :index, :show, :create,] do
      collection do
        get 'complete' => 'bookings#complete'
        post 'check' => 'bookings#check'
        patch 'withdraw' => 'booking#withdraw'
      end
    end
    resources :reviews
  end

end
