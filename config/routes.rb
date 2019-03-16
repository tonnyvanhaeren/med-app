Rails.application.routes.draw do

  # sign up page with form:
  get 'users/new' => 'users#new', as: :new_user
  # create (post) action for when sign up form is submitted:
	post 'users' => 'users#create'

  root 'home#index'
  get 'home/about'
  get 'home/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
