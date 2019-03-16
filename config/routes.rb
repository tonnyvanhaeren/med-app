Rails.application.routes.draw do

  root 'home#index'
  get 'home/about'
  get 'home/contact'

  get 'sessions/new'
  # sign up page with form:
  get 'users/new' => 'users#new', as: :new_user
  # create (post) action for when sign up form is submitted:
	post 'users' => 'users#create'
  # log in page with form:
  get '/login'     => 'sessions#new'
  # create (post) action for when log in form is submitted:
  post '/login'    => 'sessions#create'
  # delete action to log out:
  delete '/logout' => 'sessions#destroy' 

end
