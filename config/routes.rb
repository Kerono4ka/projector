Rails.application.routes.draw do
  root "boards#index"
  resources :boards do
    resources :columns, except: [:index, :show, :edit] do 
      resources :cards, except: [:index, :show] do
        resources :comments, except: [:show]
      end
    end
  end
 
  devise_for :users, 
              controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' },
              path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  resources :boards do
    post 'memberships/' => 'memberships#create', as: :memberships_create
    put 'members/:user_id/admin' => 'memberships#admin', as: :add_admin_rights
  end
  resource :user, only: [:show]
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
