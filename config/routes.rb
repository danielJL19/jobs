Rails.application.routes.draw do
  get 'pages/home'
  get 'postulacion/crear/:id',to: 'postulations#create',as: :postulation_create
resources :jobs

  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
