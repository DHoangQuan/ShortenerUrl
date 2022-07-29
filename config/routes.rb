Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          patch :change_password
        end
      end
      resources :links

      get '/links/:id/stat', to: 'links#stat'
    end
  end
end
