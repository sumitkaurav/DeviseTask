Rails.application.routes.draw do
  devise_for :users
  resources :posts do 
    resources :likes
    post "delete_image"
  end
  resources :comments do 
    resources :clikes
  end
get 'show_modal/:id', to: 'comments#show_modal', as: :show_modal_path

  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
