Cuppa::Application.routes.draw do

  namespace :admin do
    resources :feedback_answers
    resources :feedback_forms
    resources :courses do
      resources :feedback_questions
    end
    resources :users #, only: [:index, :show, :edit]
    resources :registrations, only: [:show, :destroy] do
      member do
        put :toggle_paid
      end
    end
  end
  get "/admin" => redirect("/admin/courses")

  namespace :mercury do
    resources :images
  end
  mount Mercury::Engine => '/'

  get "help/demo"

  resources :registrations do
    resource :feedback_form
    get "certificate", on: :member
  end

  resources :locations
  resources :courses, only: [:index, :show]
  resources :users, except: [:index]
  resources :sessions
  resources :registrations, except: [:destroy]

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root :to => "courses#index"
end
