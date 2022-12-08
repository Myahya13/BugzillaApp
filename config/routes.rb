Rails.application.routes.draw do
  
 
  devise_for :users
  
  

  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  
  
  resources :users do
    member do
      patch 'update', to: 'users#update'
      get :edit
    end
  end
 

  resources :bugs do 
    member do 
      get :assign
      get :assign_users
      
    end
  end
  get 'comments/new', to: 'comments#new'
  post 'comments', to: 'comments#create'
  
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
