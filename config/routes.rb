Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :movies, only: %i[index show]

      resources :users, only: %i[show create] do
        member do
          post :add_to_favorite
          get :favourite_movies_list
        end
      end
    end
  end
end
