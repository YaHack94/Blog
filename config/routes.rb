Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :tweets, only: [:new, :create, :destroy, :show]
  get 'tweets/:id/edit', to: 'tweets#edit', as: 'edit'
  get 'tweets', to: 'tweets#index'
  post 'tweets/:id/edit', to: 'tweets#update', as: 'editform'
  patch 'tweets/:id/edit', to: 'tweets#update'#, as: 'editform'
  post 'tweets/confirm', to: 'tweets#confirm', as: 'confirm'
  delete '/tweets/:id', to: 'tweets#destroy', as: 'destroy'
  root 'tweets#index'
  get '/exemple', to: 'tweets#base'
end
