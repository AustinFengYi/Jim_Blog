Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "blogs#index"
  resources :blogs,only: [:index] do
    collection do
      get :travelaround
    end

    collection do
      get :foodie
    end

    collection do
      get :introduction
    end

    collection do
      get :drawing 
    end
  end

  namespace :admin do
    root "blogs#index"
    resources :blogs 
    resources :categories
  end


end
