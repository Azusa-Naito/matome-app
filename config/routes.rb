Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :teacher do
    post 'teachers/guest_sign_in', to: 'teachers/sessions#new_guest'
  end
  
  root to: "classrooms#index"
  resources :classrooms do
    resources :chatrooms, only: [:new, :create, :show] do
      resources :chats, only: [:create]
    end
    resources :take_overs, except: :index
    resources :homeworks, except: :index do
      resources :submissions, except: :index
    end
  end
  resources :informations do
    resources :inquiries, only: [:new, :create]
  end
end
