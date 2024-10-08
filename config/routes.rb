Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students, only: :show

  resources :teachers, only: :index

  resources :courses, only: :show, path: 'classes'
end
