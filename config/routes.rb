Rails.application.routes.draw do

  root 'home#index'

  resources :home
  resources :students
  resources :courses
  resources :classrooms
end
