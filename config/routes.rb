Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "blogs#index"
  resources :blogs,only: [:index,:show] do
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
  resources :categories, only: [:show]

  namespace :admin do
    root "blogs#index"
    resources :blogs do
      collection do
        get :drafts
      end
    end
    resources :categories
    resources :carousels
  end


end
