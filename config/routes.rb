Rails.application.routes.draw do


  resources :schools, path: nil do
	  resources :departments do
		  resources :ru_classes
		  resources :ru_professors
	  end
  end

  get 'about/index'

  root :to => "welcome#index"
  devise_for :users
  resources :users

  resources :departments

  resources :ru_professors do
    resources :prof_comments, shallow: true
  end
  resources :prof_comments

  resources :ru_classes do
    resources :class_comments, shallow: true
  end
  resources :class_comments

end
