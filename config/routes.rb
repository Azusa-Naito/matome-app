Rails.application.routes.draw do
  devise_for :students
  devise_scope :student do
    post 'students/guest_sign_in', to: 'students/sessions#new_guest'
  end
  devise_for :teachers
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
