Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "announcements#index"
  resources :announcements,only: [:index] do
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

  
end
