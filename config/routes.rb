Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "classrooms#index"
  resources :classrooms, only: [:index, :new, :create, :show] do
    resources :chatrooms, only: [:new, :create, :show] do
      resources :chats, only: [:create]
    end
    resources :take_overs, only: [:new, :create, :show]
    resources :homeworks, only:[:new, :create, :show] do
      resources :submissions, only:[:new, :create, :show]
    end
  end
  resources :informations, only: [:index, :new, :create, :show] do
    resources :inquiries, only: [:new, :create]
  end
end
