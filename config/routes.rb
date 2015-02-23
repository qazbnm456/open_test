OpenTest::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'index#home'
  match '/help', to: 'index#help', via: 'get'
  match '/about', to: 'index#about', via: 'get'

  match '/profiles', to: 'profiles#index', via: 'get'

  match '/request/:id', to: 'requests#show', via: 'get', as: 'request_show'
  match '/request', to: 'requests#index', via: 'get'

  match '/bug/:id', to: 'bugs#show', via: 'get', as: 'bug_show'
  match '/bug', to: 'bugs#index', via: 'get'
  match '/bug/create', to: 'bugs#create', via: 'post', as: 'create_bug'
  resource :request
  resource :bug

  devise_scope :user do
    get "register", :to => "devise/registrations#new"
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end
end
