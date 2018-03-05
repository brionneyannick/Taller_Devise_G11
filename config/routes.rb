Rails.application.routes.draw do
  get 'admins/user'

  devise_for :users
  resources :histories
  get 'admins/history', to: 'admins#history'
  get 'admins/user', to: 'admins#user'
  post 'admins/make_user', to: 'admins#make_user', as: 'make_user'
  post 'admins/make_admin', to: 'admins#make_admin', as: 'make_admin'

  root "histories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
