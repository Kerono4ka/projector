Rails.application.routes.draw do
  root "boards#index"
  resources :boards do
    resources :columns do
      resources :cards do
        resources :comments, except: [:show]
      end
    end
  end
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  resources :users, only: [:show]
end
